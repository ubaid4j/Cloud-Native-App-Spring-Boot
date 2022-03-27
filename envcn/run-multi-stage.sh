docker pull ubaidurehman/3cn-parent:0.0.3-SNAPSHOT;
#Cleaing Database so, that, we can run  /docker-entrypoint-initdb.d/init.sql (gh-370)
#If there is data inside the database then /docker-entrypoint-initdb.d/init.sql not running
docker container stop cn-db;
docker container rm cn-db;
docker volume rm envcn_cloud-native-volume;

#There is a random error (gh-282) when starting auth-server.
#To remove the possibility of gh-282, we are removing auth-db data.
docker container stop auth-db;
docker container rm auth-db;
docker volume rm envcn_auth-db-volume;

docker-compose -f docker-compose-multi-stage-build.yml up --build