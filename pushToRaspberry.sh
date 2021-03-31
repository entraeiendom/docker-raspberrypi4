#!/bin/sh
PI=${1:-192.168.2.206}
BASEDIR=$(pwd)
rsync -azvv -e ssh $BASEDIR/scripts $BASEDIR/docker $BASEDIR/Dockerfile  pi@$PI:/home/pi/sources/docker-raspberrypi4-devops