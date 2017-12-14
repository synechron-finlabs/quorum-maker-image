#!/bin/bash

#This is for base tag of image syneblock/quorum-master:base
apt-get update
apt-get install -y libdb-dev libleveldb-dev libsodium-dev zlib1g-dev libtinfo-dev
apt-get install -y build-essential
apt-get install -y wget
apt-get install -y curl
apt-get install nano
apt-get install -y git
apk add --update go git mercurial build-base
apt-get install -y make
apt-get install -y telnetd
apt-get install -y openssh-server






