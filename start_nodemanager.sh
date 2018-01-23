#!/bin/bash

cd /root/quorum-maker/
java -jar nodeManager.jar
socket="http://localhost:$rpcPort"
./NodeManagerGo $socket $golistenPort