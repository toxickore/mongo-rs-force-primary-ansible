#!/bin/bash
if [ "$(sudo docker images | grep mongo_ex | wc -l)" -eq "0" ];
then
	sudo docker build -t mongo_ex .
fi

if [ "$(sudo docker network ls | grep mongo_cluster | wc -l)" -eq "0" ];
then
	echo "#################################"
	echo "# creating docker mongo_cluster #"
	echo "#################################"
	sudo docker network create mongo_cluster
fi

sudo docker run -p 28001:27017 --name mongo_instance_001 --net mongo_cluster mongo_ex mongod --setParameter authenticationMechanisms=MONGODB-CR --replSet rs0 &
sudo docker run -p 28002:27017 --name mongo_instance_002 --net mongo_cluster mongo_ex mongod --setParameter authenticationMechanisms=MONGODB-CR --replSet rs0 &
sudo docker run -p 28003:27017 --name mongo_instance_003 --net mongo_cluster mongo_ex mongod --setParameter authenticationMechanisms=MONGODB-CR --replSet rs0 &
sudo docker run -p 28004:27017 --name mongo_instance_004 --net mongo_cluster mongo_ex mongod --setParameter authenticationMechanisms=MONGODB-CR --replSet rs0 &
sudo docker run -p 28005:27017 --name mongo_instance_005 --net mongo_cluster mongo_ex mongod --setParameter authenticationMechanisms=MONGODB-CR --replSet rs0 &
echo "#################################"
echo "#    Starting Replication Set   #"
echo "#################################"
sleep 15
mongo --port 28001 start_rs.js
echo "#################################"
echo "#  Forcing node 02 as primary   #"
echo "#################################"
sleep 20
mongo --port 28001 primary.js
echo "#################################"
echo "#    Add arbiter member         #"
echo "#################################"
sleep 20
mongo --port 28003 arbiter.js
