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
RUN adduser --force-badname bacnetagent
# Upgrades
# apt update
# apt upgrade bl. 11.0.6.10
# apt install cron
ADD scripts/* /home/bacnetagent/scripts
RUN chmod 755 /home/bacnetagent/scripts/*

WORKDIR "/home/bacnetagent"
