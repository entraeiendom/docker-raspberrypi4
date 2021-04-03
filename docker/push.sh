#!/bin/sh
IMAGE_TAG=${1:-latest}
IMAGE_NAME=baardl/java-semantic-pi4
docker push  $IMAGE_NAME:$IMAGE_TAG
