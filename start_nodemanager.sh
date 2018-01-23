#!/bin/bash
# $1 is rpcPort and $2 is golistenPort
cd /root/quorum-maker/
java -jar nodeManager.jar
socket="http://localhost:$1"
./NodeManagerGo $socket $2