#!/bin/bash
./scripts/semantic_update_service.sh
if [ $? -eq 0 ]
then
  ./scripts/kill-service.sh
  ./scripts/start-service.sh
  echo "Successfully updated service"
else
  echo "No updates found"
  if ps -ef | grep java | grep tfm2rec; then
     echo "Process found"
  else
     echo "Process not found - restarting"
    ./scripts/start-service.sh
  fi
fi
