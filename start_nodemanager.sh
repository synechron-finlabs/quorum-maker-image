#!/bin/bash

cd /root/quorum-maker/
java -jar nodeManager.jar
rpcPort=22000
golistenPort=8090
socket="http://10.34.14.204:$rpcPort"
./NodeManagerGo $socket $golistenPort


