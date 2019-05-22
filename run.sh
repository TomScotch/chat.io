service redis-server start ;
mongod --bind_ip 0.0.0.0 --journal --port 27017 ;
nodejs server.js
