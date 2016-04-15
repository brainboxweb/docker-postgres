#!/usr/bin/env bash



echo "Stopping running container (if any)..."
docker stop $(docker ps -a | grep posty | awk '{print $1}')


echo  "Deleting  container (if any)..."
docker rm $(docker ps -a | grep post | awk '{print $1}')


echo  "Building base container..."
docker build -t posty .


echo "docker-compose up..."
docker-compose up -d

#Get ID of running container
ID="$(docker-compose ps -q)"


echo "Waiting for container(s) to be ready. (This might take a minute.)"


echo "Waiting for containers to start"
until docker logs $ID  2>&1 | grep -m 1 "autovacuum"; do : ; done


sleep 2;


echo "Creating databases..."
docker exec -it $ID /bin/bash -c './setup_db.sh'


echo ""
echo ""
echo "All done!"
echo "---------"
echo ""
