#!/bin/sh
PRF_PCOL_URI=$1
IMAGE_TAG=latest
IMAGE=baardl/java-semantic-pi4
IMAGE_NAME=java-semantic-pi4
curr_dir=${PWD}
docker run -d  --name=$IMAGE_NAME -e NEXUS_USER=$NEXUS_USER -e NEXUS_PW=$NEXUS_PW "$IMAGE:$IMAGE_TAG"