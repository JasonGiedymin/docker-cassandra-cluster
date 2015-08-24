#!/bin/bash
# Official readme: https://github.com/docker-library/docs/blob/master/cassandra/README.md
#
# Preferred method is to use the docker-compose command rather than this script.
# (when there is one)

# echo "Preferred method is to use the docker-compose command rather than this script."
# echo "Waiting 5 seconds before proceeding..."
# sleep 5

export TAG=latest

docker rm cassandra-1
docker run --name cassandra-1 -v ./cassandra-1:/var/lib/cassandra/data cassandra:$TAG

sleep 10

docker rm cassandra-2
docker run --name cassandra-2 -d -e CASSANDRA_SEEDS="cassandra-1" cassandra:$TAG
# docker run --name cassandra-2 -d -e CASSANDRA_SEEDS="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' cassandra-1)" cassandra:$TAG

sleep 10

# Test cqlsh
docker run -it --link cassandra-1:cassandra --rm cassandra cqlsh cassandra

# To link:
#docker run --name some-app --link some-cassandra:cassandra -d app-that-uses-cassandra

# login to first container
# docker exec -it cassandra-1 bash

# or use docker logs
# docker logs cassandra-1

# Stop them all
# docker stop cassandra-1 && docker stop cassandra-2
