#!/bin/bash

#This is for languages tag of docker image syneblock/quorum-master:languages 
#Remove this part if you want to build base image of ubuntu with essential utils


wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
tar -xf go1.9.2.linux-amd64.tar.gz
mv go /usr/local
cp /usr/local/go/bin/go /usr/bin/.
echo 'GOROOT=/usr/local/go' >> ~/.bashrc
echo 'PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

apt-get install -y build-essential
