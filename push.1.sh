#!/bin/bash

PROJECT_ID="virtualmachines-154415"
IMAGE_NAME="docker-centos-desktop-ibgateway"
IMAGE_VERSION="1.0.0"

indent() { sed 's/^/\t/'; }

echo "+ Tagging image.."
CMD="
    docker tag $IMAGE_NAME:$IMAGE_VERSION gcr.io/virtualmachines-154415/$IMAGE_NAME:$IMAGE_VERSION
"
echo "+ Pushing built image to registry servers.."

CMD="

gcloud docker -- push gcr.io/$PROJECT_ID/$IMAGE_NAME

"

echo "Docker Command:" | indent

$CMD | indent