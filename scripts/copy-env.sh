#!/bin/bash
ENV_FILE=${1:-"$(pwd)/java-semantic-pi4.env"}
array_contains () {
    local seeking=$1; shift
    local in=1
    for element; do
        if [[ $element == "$seeking" ]]; then
            in=0
            break
        fi
    done
    return $in
}
arr=("_" "LANG" "PWD" "HOME" "TERM" "SHLVL" "PATH" "SHELL")
env | while IFS= read -r line; do
  value=${line#*=}
  name=${line%%=*}

  array_contains "$name" "${arr[@]}" && echo "$name: ignored" || echo "export $name=$value" >> $ENV_FILE
#
#  if array_contains $value "${arr[@]}" ;
#  then
#    echo "$name=$value" >> $(pwd)/java-semantic-pi4.env.ignored
#  else
#    echo "$name=$value" >> $(pwd)/java-semantic-pi4.env
#  fi
done



#_=/usr/bin/env
#LANG=C.UTF-8
#HOSTNAME=987dec649579
#JAVA_HOME=/docker-java-home
#JAVA_VERSION=11.0.3
#POM_GROUP_ID=bacnet-commands-cli
#PWD=/home/bacnetagent
#HOME=/root
#NEXUS_USER=whydah-ci
#JAVA_DEBIAN_VERSION=11.0.3+1-1~bpo9+1
#NEXUS_PW=sikkerhetErTopp4Whydah
#TERM=xterm
#SHLVL=2
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#POM_ARTIFACT_ID=bacnet-commands-cli
#TRACE=1
