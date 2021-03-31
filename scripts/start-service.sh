#!/bin/sh
JAR_NAME=$POM_ARTIFACT_ID.jar
nohup java -jar $JAR_NAME &
