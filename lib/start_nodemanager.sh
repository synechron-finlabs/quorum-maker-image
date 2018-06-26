#!/bin/bash

# $1 is rpcPort and $2 is golistenPort and $3 is IP Address
cd /root/quorum-maker/

if [ -z "$3" ]; then
	socket="http://localhost:$1"
else	
	socket="http://$3:$1"
fi


if [ $# -gt 1 ]; then
	./NodeManager $socket $2
else
	./NodeManager
fi
