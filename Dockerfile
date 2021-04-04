FROM arm32v7/openjdk:11.0.3-jre
MAINTAINER Bard Lind <bard.lind@gmail.com>
#RUN yum -y install yum-cron
#RUN yum -y update
#RUN yum -y install curl

# Install Application
#RUN adduser bacnetagent
# Create a group and user
#RUN addgroup -S bacnet && adduser -S bacnetagent -G bacnet
#ADD target/bacnet-ip-agent-*.jar /home/bacnetagent/bacnet-ip-agent.jar
#ADD docker/bacnetagent_override.properties /home/bacnetagent/bacnetagent-override.properties
#RUN chown bacnetagent:bacnetagent /home/bacnetagent/bacnetagent.properties

RUN apt -y update
RUN apt -y upgrade
RUN apt install -y cron
RUN apt install -y vim
RUN apt install -y procps
RUN adduser --force-badname bacnetagent

## TEST
#ADD envecho.sh /home/bacnetagent/envecho.sh
#RUN chmod +x  /home/bacnetagent/envecho.sh
#ADD java-semantic-pi4.env /home/bacnetagent/java-semantic-pi4.env
## end test
# Scripts
RUN mkdir /home/bacnetagent/scripts
ADD scripts/* /home/bacnetagent/scripts/
RUN chmod 755 /home/bacnetagent/scripts/*
RUN chown -R bacnetagent:bacnetagent /home/bacnetagent
ADD cron.log /var/log/cron.log
RUN chown bacnetagent:bacnetagent /var/log/cron.log
#USER bacnetagent
WORKDIR "/home/bacnetagent"

ENV BACNET_PORT 47808
EXPOSE ${BACNET_PORT}
EXPOSE ${BACNET_PORT}/udp
#RUN crontab scripts/CRON
#CMD ["scripts/download_and_restart_if_new.sh"]
ENTRYPOINT ["./scripts/entrypoint.sh"]
#CMD ["cron", "-f"]
#expose 18183
