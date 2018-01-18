#!/bin/bash
if [ "$1" == "java" ]; then
	sed -i.bak -e '11,14d' Dockerfile
	LISTENPORT=$2
	export LISTENPORT
	RPCPORT=$3
	export RPCPORT
else
	sed -i.bak -e '7,10d' Dockerfile
	LISTENPORT=$1
	export LISTENPORT
	RPCPORT=$2
	export RPCPORT
fi

echo "Please provide the image name"
read imagename
echo "Please provide the tag name"
read tagname
dockername=$imagename":"$tagname
echo "The docker image name: "$dockername
docker build -t $dockername .
DOCKERNAME=$dockername
export DOCKERNAME
./setup.sh
