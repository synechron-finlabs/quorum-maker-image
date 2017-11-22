#!/bin/bash
apt-get install openjdk-8-jdk
cd /opt/
wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
sudo tar -xvzf apache-maven-3.3.9-bin.tar.gz
echo "export M2_HOME=/opt/maven">>/etc/profile.d/mavenenv.sh
echo "export PATH=${M2_HOME}/bin:${PATH}">>/etc/profile.d/mavenenv.sh
chmod +x /etc/profile.d/mavenenv.sh
source /etc/profile.d/mavenenv.sh
cd /root/quorum
git clone https://gitlab.com/quorum-maker/NodeManager.git
cd NodeManager
mvn clean
mvn install
cd target
java -jar joinNetwork.jar &
