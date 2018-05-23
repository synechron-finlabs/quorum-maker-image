#!/bin/bash
# $1 is rpcPort and $2 is golistenPort and $3 is logPort
cd /root/quorum-maker/
java -jar nodeManager.jar
socket="http://localhost:$1"
if [ $# -gt 1 ]; then
	./NodeManagerGo $socket $2 $3
else
	./NodeManagerGo
fi
