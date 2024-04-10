db.getSiblingDB("unifi").createUser({user: "USERNAME", pwd: "PASSWORD", roles: [{role: "dbOwner", db: "unifi"}]});
db.getSiblingDB("unifi_stat").createUser({user: "USERNAME", pwd: "PASSWORD", roles: [{role: "dbOwner", db: "unifi_stat"}]
});
