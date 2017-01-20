#!/bin/bash

docker ps -a
docker images -a

docker rm -f $(docker ps -a -f status=exited -q)
docker rmi -f $(docker images -a -q)

docker images
docker ps -a

