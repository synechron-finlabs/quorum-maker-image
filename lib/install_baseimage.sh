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

apt-get install bsdmainutils

add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
apt install openjdk-11-jdk -y

apt-get -y install maven
apt-get -y install net-tools
apt-get -y install git

wget https://github.com/ethereum/solidity/releases/download/v0.5.2/solc-static-linux
chmod +x solc-static-linux
mv solc-static-linux /usr/bin/solc
