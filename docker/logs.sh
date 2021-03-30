#!/bin/sh
NAME=java-semantic-pi4
docker logs -f $(docker ps -aqf "name=$NAME")