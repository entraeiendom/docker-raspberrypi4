#!/bin/sh
for n in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
do
  sleep 3
  JSON="`wget -qO-  http://localhost:8080/api/status`";wget --method=PUT --body-data="${JSON}" https://visuale-devtest.entraos.io/api/status/EntraOS-DEVTEST/EntraOS%20tfm2rec%20API/node?service_tag=DEVELOPMENT
done