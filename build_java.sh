#!/bin/bash
apt-get install openjdk-8-jdk
cd /root/quorum
java -jar joinNetwork.jar &
