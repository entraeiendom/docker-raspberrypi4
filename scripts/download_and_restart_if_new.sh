#!/bin/bash
echo POM_GROUP_ID=$POM_GROUP_ID, POM_ARTIFACT_ID=$POM_ARTIFACT_ID
./scripts/semantic_update_service.sh
if [ $? -eq 0 ]
then
  ./scripts/kill-service.sh
  ./scripts/start-service.sh
  echo "Successfully updated service"
else
  echo "No updates found"
  if ps -ef | grep java | grep $POM_ARTIFACT_ID; then
     echo "Process is found: java $POM_ARTIFACT_ID "
  else
     echo "Process not found java $POM_ARTIFACT_ID - restarting"
    ./scripts/start-service.sh
  fi
fi
