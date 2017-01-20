#!/bin/bash

# ENV CONF_API_PORT=4444
# ENV CONF_TRADING_MODE=paper
# ENV CONF_IB_USER=greg2017
# ENV CONF_IB_PASS=alglab111
# ENV CONF_IB_READ_ONLY=no

indent() { sed 's/^/\t/'; }

echo "+ Removing any existing containers.."
docker rm -f gateway

echo "+ Starting container..."

CMD="
docker run -id  -e CONF_VNC_PASS=changeme \\
                -e CONF_CONTROLLER_PORT=4440 \\
                -e CONF_API_PORT=4100 \\
                -e CONF_TRADING_MODE=paper \\
                -e CONF_IB_USER=$CONF_USER \\
                -e CONF_IB_PASS=$CONF_PASS \\
                -e CONF_IB_READ_ONLY=no \\
                -p 5901:5901 -p 6901:6901 -p 4100:4100 -p 4440:4440 \\
                --name gateway \\
                appsoa/docker-centos-desktop-ibgateway:latest
"
echo
echo -n "Docker command:" | indent
echo "$CMD" | indent

$(echo $CMD | sed 's/\\//g')

docker run -id  -e CONF_VNC_PASS=changeme \
                -e CONF_CONTROLLER_PORT=4440 \
                -e CONF_API_PORT=4100 \
                -e CONF_TRADING_MODE=paper \
                -e CONF_IB_USER=$CONF_USER \
                -e CONF_IB_PASS=$CONF_PASS \
                -e CONF_IB_READ_ONLY=no \
                -p 5901:5901 -p 6901:6901 -p 4100:4100 -p 4440:4440 \
                --name gateway \
                appsoa/docker-centos-desktop-ibgateway:latest | indent

docker logs algolab -f --tail all