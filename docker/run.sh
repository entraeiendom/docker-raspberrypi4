#!/bin/sh
NEXUS_USER=$1
NEXUS_PW=$2
POM_GROUP_ID=${3:-no/entra/bacnet}
POM_ARTIFACT_ID=${4:-bacnet-commands-cli}
IMAGE_TAG=latest
IMAGE=baardl/java-semantic-pi4
IMAGE_NAME=java-semantic-pi4
curr_dir=${PWD}
docker run -t -d  --name=$IMAGE_NAME -e NEXUS_USER=$NEXUS_USER -e NEXUS_PW=$NEXUS_PW -e POM_GROUP_ID=$POM_ARTIFACT_ID -e POM_ARTIFACT_ID=$POM_ARTIFACT_ID -e TRACE=1 "$IMAGE:$IMAGE_TAG"
