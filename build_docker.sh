#!/bin/bash
if [ "$1" == "java" ]; then
	sed -i.bak -e '11,14d' Dockerfile
else
	sed -i.bak -e '7,10d' Dockerfile
fi

docker build -t syneblock/quorum-master:2.0 .