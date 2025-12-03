postgres:
  container_name: postgres-db
  image: postgres
  environment:
    POSTGRES_USER: PG_USER
    POSTGRES_PASSWORD: PG_PASSWORD
  ports:
    - "5432:5432"
  volumes:
    - postgres:/var/lib/postgresql/data
  healthcheck:
    test: ["CMD-SHELL", "cat /initialised.txt && pg_isready -U postgres"]
    interval: 10s
    timeout: 5s
    retries: 5
  entrypoint: [ "/bin/bash", "-c","
    docker-entrypoint.sh postgres &
    rm -f /initialised.txt || true &&
    until pg_isready -U postgres; do sleep 3; done &&
    psql -U PG_USER -d postgres -c 'CREATE DATABASE ms_catalog;' || true &&
    psql -U PG_USER -d postgres -c 'CREATE DATABASE ms_profile;' || true &&
    psql -U PG_USER -d postgres -c 'CREATE DATABASE ms_cache;' || true &&
    psql -U PG_USER -d postgres -c 'CREATE DATABASE ms_payment;' || true &&
    psql -U PG_USER -d postgres -c 'CREATE DATABASE ms_notification;' || true &&
    echo done > /initialised.txt &&
    wait"
  ]


By default psql connects to the database with the same name as the user. So there is a convention to make that the "user's database". 
And there isn't any reason to break that convention if your user only needs one database. We'll be using mydatabase as the example database name.

    Using createuser and createdb, we can be explicit about the database name,

    $ sudo -u postgres createuser -s $USER
    $ createdb mydatabase
    $ psql -d mydatabase

    You should probably be omitting that entirely and letting all the commands default to the user's name instead.

    $ sudo -u postgres createuser -s $USER
    $ createdb
    $ psql

    Using the SQL administration commands, and connecting with a password over TCP

    $ sudo -u postgres psql postgres

    And, then in the psql shell

    CREATE ROLE myuser LOGIN PASSWORD 'mypass';
    CREATE DATABASE mydatabase WITH OWNER = myuser;

    Then you can login,

    $ psql -h localhost -d mydatabase -U myuser -p <port>

    If you don't know the port, you can always get it by running the following, as the postgres user,

    SHOW port;

    Or,

    $ grep "port =" /etc/postgresql/*/main/postgresql.conf

