#!/bin/bash

#This is for base tag of image
apt-get update
apt-get install -y libdb-dev libleveldb-dev libsodium-dev zlib1g-dev libtinfo-dev
apt-get install -y build-essential
apt-get install -y wget
apt-get install -y curl
apt-get install -y git
apk add --update go git mercurial build-base
apt-get install -y make
apt-get install -y telnetd
apt-get install -y openssh-server


#This is for languages tag of docker image. 
#Remove this part if you want to build base image of ubuntu with essential utils
wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
tar -xf go1.9.2.linux-amd64.tar.gz
mv go /usr/local
cp /usr/local/go/bin/go /usr/bin/.
echo 'GOROOT=/usr/local/go' >> ~/.bashrc
echo 'PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

apt-get install openjdk-8-jdk

curl -sL https://deb.nodesource.com/setup_6.x | bash 
apt-get install nodejs
apt-get install build-essential



