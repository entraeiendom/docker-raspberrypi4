# docker-raspberrypi4
Semantic update service running on ARM v7

## Pre-Installation on Ubuntu
https://www.docker.com/blog/getting-started-with-docker-for-arm-on-linux/

## Environment Variables

```
Required
NEXUS_USER=<username for jar repository>
NEXUS_PW=<password for jar repository>
POM_GROUP_ID= eg no/entra/bacnet
POM_ARTIFACT_ID=eg bacnet-commands-cli
Optional
TRACE=1 # Enable logging of semantic update scripts
```

## What is run
```
java -jar $POM_ARTIFACT_ID.jar
```
Any extra environment variables will be acceccible to the jar.
```
eg
docker run -t -d  --name=$IMAGE_NAME -eLOG_LEVEL=INFO baardl/java-semantic-pi4
```

## How to run from Raspberry Pi

1. docker/build.sh
2. docker/run.sh <nexus_user> <nexus_pw> <group_id> <artifcact_id>

### Not supported

* Java Environment with -D
```
eg:
java -DlogLevel=INFO -jar jarName.jar
```
* Properties files are not supported
```
eg config_override.properties
```

## How to build new version

1. docker/build.sh
2. docker/run.sh <nexus_user> <nexus_pw> <group_id> <artifcact_id>
3. docker/attach.sh

Check cron log
```
docker exec -ti java-semantic-pi4 tail -f /var/log/cron.log
```

