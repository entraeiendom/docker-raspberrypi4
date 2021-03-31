#!/bin/sh
IMAGE_TAG=latest
IMAGE_NAME=baardl/java-semantic-pi4
CONTAINER_NAME=java-semantic-pi4
curr_dir=${PWD}
docker run -d  --name=$CONTAINER_NAME "$IMAGE_NAME:$IMAGE_TAG"
