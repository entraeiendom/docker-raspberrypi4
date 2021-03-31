#!/bin/sh

BASEDIR=$(pwd)

#docker build --no-cache -t baardl/java-semantic-pi4:$TAG .
IMAGE_TAG=${1:-latest}
IMAGE_NAME=baardl/java-semantic-pi4
IMAGE_TITLE="Semantically updatable java service."

echo "Building Docker image $IMAGE_TITLE ($IMAGE_ID) from $BASEDIR."

docker build -t "$IMAGE_NAME:$IMAGE_TAG" "$BASEDIR" 
#docker build -t "$IMAGE_NAME:$IMAGE_TAG" "$BASEDIR" --no-cache|| exit 1

# Require push before inspect
#docker push $IMAGE_NAME:$IMAGE_TAG
#docker buildx imagetools inspect $IMAGE_NAME:$IMAGE_TAG
