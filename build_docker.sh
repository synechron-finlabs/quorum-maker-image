#!/bin/bash
if [ "$1" == "java" ]; then
	sed -i.bak -e '10,12d' Dockerfile
else
	sed -i.bak -e '7,9d' Dockerfile
fi

docker build -t syneblock/quorum-master:2.0 .
