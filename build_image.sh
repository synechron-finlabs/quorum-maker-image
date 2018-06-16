#!/bin/bash

imagename="syneblock/quorum-maker"
tagname="2.0.2_Dev"

if [ ! -z "$1" ]; then
    imagename=$1
fi

if [ ! -z "$2" ]; then
    tagname=$2
fi


lib/install_quorum.sh
lib/build_nodemanager.sh
lib/build_ui.sh

dockername=$imagename":"$tagname
echo "The docker image name: "$dockername
docker build --no-cache -t $dockername .
