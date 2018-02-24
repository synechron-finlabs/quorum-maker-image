#!/bin/bash
set -x
if [ -f  Dockerfile.bak ]; then
    cp -f Dockerfile.bak Dockerfile

else
	cp -f Dockerfile Dockerfile.bak
fi

if [ "$1" == "java" ]; then
	echo "Using Java based Node Manager"
	
	sed -i.bak -e '11,14d' Dockerfile
	sed -i.bak -e '5,10d' start_nodemanager.sh
	
	if [ ! -e  NodeManager ]; then
		ln -s ../NodeManager NodeManager
	fi
	
else
	echo "Using Golang based Node Manager"

	sed -i.bak -e '7,10d' Dockerfile
	sed -i.bak -e '4d' start_nodemanager.sh
	

	if [ ! -e  NodeManagerGo ]; then
		ln -s ../NodeManagerGo NodeManagerGo
	fi
fi

echo "Please provide the image name"
read imagename
echo "Please provide the tag name"
read tagname
dockername=$imagename":"$tagname
echo "The docker image name: "$dockername
docker build -t $dockername .
