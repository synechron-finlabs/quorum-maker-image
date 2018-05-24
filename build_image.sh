#!/bin/bash
set -x

imagename="syneblock/quorum-maker"
tagname="2.0.2_6"

rm -f start_nodemanager.sh

if [ -f  Dockerfile.bak ]; then
    cp -f Dockerfile.bak Dockerfile

else
	cp -f Dockerfile Dockerfile.bak
fi

if [ "$1" == "java" ]; then
	echo "Using Java based Node Manager"
	
	sed -i.bak -e '11,14d' Dockerfile
	cp start_nodemanager_java.sh start_nodemanager.sh
	
	if [ ! -e  NodeManager ]; then
		cp -r ../NodeManager NodeManager
	fi
	
else
	echo "Using Golang based Node Manager"

	sed -i.bak -e '7,10d' Dockerfile
	cp start_nodemanager_go.sh start_nodemanager.sh
		

	if [ ! -e  NodeManagerGo ]; then
		cp -r ../NodeManagerGo NodeManagerGo
	fi
fi

if [ ! -z "$1" ]; then
    imagename=$1
fi

if [ ! -z "$2" ]; then
    tagname=$2
fi


dockername=$imagename":"$tagname
echo "The docker image name: "$dockername
docker build --no-cache -t $dockername .
