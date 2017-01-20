#!/bin/bash

PROJECT_ID="virtualmachines-154415"
IMAGE_NAME=$1
IMAGE_VERSION=$2

indent() { sed 's/^/\t/'; }

echo "Pushing $1:$2"
echo "+ Tagging image.."
CMD="
    docker tag $IMAGE_NAME:$IMAGE_VERSION gcr.io/virtualmachines-154415/$IMAGE_NAME:$IMAGE_VERSION
"
echo "Docker Command: $CMD" | indent

echo "+ Pushing built image to registry servers.."

CMD="
gcloud docker -- push gcr.io/$PROJECT_ID/$IMAGE_NAME
"

echo "Docker Command: $CMD" | indent

# $CMD | indent