#!/bin/bash
if [ "$1" == "java" ]; then
	sed -i.bak -e '11,14d' Dockerfile
	sed -i.bak -e '5,10d' start_nodemanager.sh
else
	sed -i.bak -e '7,10d' Dockerfile
	sed -i.bak -e '4d' start_nodemanager.sh
fi

echo "Please provide the image name"
read imagename
echo "Please provide the tag name"
read tagname
dockername=$imagename":"$tagname
echo "The docker image name: "$dockername
docker build -t $dockername .
