#!/bin/sh
PRF_PCOL_URI=$1
IMAGE_TAG=latest
IMAGE=baardl/java-semantic-pi4
IMAGE_NAME=java-semantic-pi4
curr_dir=${PWD}
docker run -d  --name=$IMAGE_NAME -e prf_pcol_uri=$PRF_PCOL_URI -p 22500:22500 "$IMAGE:$IMAGE_TAG"