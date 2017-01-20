#!/bin/bash

DIR=$1
PROJECT_ID=$2
IMAGE_NAME=$3
IMAGE_VERSION=$4
REPO_HOST=$5
ARGS=$6
cd $1

indent() { sed 's/^/    [docker build] /'; }
echo "+ Building ibgateway container into image.."
# exec 1> >(sed -r 's/^(.*)/\t- \1/g')

docker build $ARGS -t  $REPO_HOST/$PROJECT_ID/$IMAGE_NAME:$IMAGE_VERSION . | indent
# docker build -t appsoa/docker-centos-desktop-ibgateway:latest . | indent

# docker build --force-rm --no-cache -t appsoa/docker-centos-desktop-ibgateway:testing .
