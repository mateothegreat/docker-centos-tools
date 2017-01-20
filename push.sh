#!/bin/bash

DIR=$1
PROJECT_ID=$2
IMAGE_NAME=$3
IMAGE_VERSION=$4
REPO_HOST=$5

cd $1

indent() { sed 's/^/\t/'; }

echo "Pushing $1:$2"
echo "+ Tagging image.."
CMD="
    docker tag $IMAGE_NAME:$IMAGE_VERSION $REPO_HOST/$PROJECT_ID/$IMAGE_NAME:$IMAGE_VERSION
    docker tag $IMAGE_NAME:$IMAGE_VERSION $REPO_HOST/$PROJECT_ID/$IMAGE_NAME:latest
"
echo "Docker Command: $CMD" | indent

echo "+ Pushing built image to registry servers.."

CMD="
    gcloud docker -- push gcr.io/$PROJECT_ID/$IMAGE_NAME:$IMAGE_VERSION 
"

echo "Docker Command: $CMD" | indent

$CMD | indent
