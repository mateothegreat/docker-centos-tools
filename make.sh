#!/bin/bash

docker ps -a
docker images -a

docker rm -f $(docker ps -a -f status=exited -q)
docker rmi -f $(docker images -a -q)

cd ~/algolab/docker-centos-base-java/; ./build.sh; git add .; git commit -am'tick tock'
cd ~/algolab/docker-centos-desktop-xfce/; ./build.sh; git add .; git commit -am'tick tock'
cd ~/algolab/docker-centos-desktop-vnc/; ./build.sh; git add .; git commit -am'tick tock'
cd ~/algolab/docker-centos-desktop-ibgateway/; ./build.sh; git add .; git commit -am'tick tock'

./run.sh

# cd ~/algolab

docker images

