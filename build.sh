#!/bin/bash

indent() { sed 's/^/    [docker build] /'; }
echo "+ Building ibgateway container into image.."
# exec 1> >(sed -r 's/^(.*)/\t- \1/g')

docker build -t appsoa/docker-centos-desktop-ibgateway:latest . | indent

# docker build --force-rm --no-cache -t appsoa/docker-centos-desktop-ibgateway:testing .
