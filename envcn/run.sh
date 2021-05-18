#Cleaing Database so, that, we can run  /docker-entrypoint-initdb.d/init.sql (gh-370)
#If there is data inside the database then /docker-entrypoint-initdb.d/init.sql not running
docker container stop cn-db;
docker container rm cn-db;
docker volume rm envcn_cloud-native-volume;

docker container stop auth-db;
docker container rm auth-db;
docker volume rm envcn_auth-db-volume;

docker-compose up --build