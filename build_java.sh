#!/bin/bash
apt-get install openjdk-8-jdk
cd /root/quorum
git clone https://gitlab.com/quorum-maker/NodeManager.git
cd NodeManager
mvn clean
mvn install
cd target
java -jar joinNetwork.jar &
