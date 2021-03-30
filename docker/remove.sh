#!/bin/sh
echo stopping java-semantic-pi4
docker stop java-semantic-pi4
echo removing java-semantic-pi4
docker rm java-semantic-pi4
echo list active docker containers
docker ps
