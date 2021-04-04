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




