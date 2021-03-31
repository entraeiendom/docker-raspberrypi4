#!/bin/bash
JAR_NAME=$POM_ARTIFACT_ID.jar
echo starting first time >> /var/log/cron.log
/bin/su -p -c "crontab scripts/CRON" - bacnetagent &
/bin/su -p -c "./scripts/semantic_update_service.sh >> /var/log/cron.log 2>&1 " - bacnetagent &

echo downloaded newest version >> /var/log/cron.log
echo starting java >> /var/log/cron.log
/bin/su -p -c "nohup java -jar $JAR_NAME & " - bacnetagent &

# Keep docker running
#tail -f /dev/null
cron -f

