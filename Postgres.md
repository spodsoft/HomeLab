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
