#!/bin/bash

#This is for base tag of image syneblock/quorum-master:base
apt-get update
apt-get install -y libdb-dev libleveldb-dev libsodium-dev zlib1g-dev libtinfo-dev
apt-get install -y build-essential
apt-get install software-properties-common python-software-properties -y
apt-get install -y wget
apt-get install -y curl
apt-get install -y jq
apt-get install -y psmisc
apt-get install -y iputils-ping
add-apt-repository ppa:ethereum/ethereum -y
apt-get update
apt-get install solc -y