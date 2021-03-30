#!/bin/bash
echo starting first time
./scripts/semantic_update_service.sh

echo downloaded newest version
echo starting java
nohup java -jar bacnet-commands-cli.jar listen &

# Keep docker running
tail -f /dev/null
