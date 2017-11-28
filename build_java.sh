#!/bin/bash
apt-get -y update
apt-get install -y wget
apt-get install -y openjdk-8-jdk
cp /usr/lib/jvm/java-8-openjdk-amd64/jre/java /usr/bin/.
wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
mkdir -p /usr/local/apache-maven
mv apache-maven-3.3.9-bin.tar.gz /usr/local/apache-maven/.
cd /usr/local/apache-maven
tar -xvzf apache-maven-3.3.9-bin.tar.gz
echo 'export JAVA_HOME=/usr' >> ~/.bashrc
echo 'export M2_HOME=/usr/local/apache-maven/apache-maven-3.3.9'>> ~/.bashrc
echo 'export M2=$M2_HOME/bin'>> ~/.bashrc
echo 'export MAVEN_OPTS="-Xms256m -Xmx512m"' >> ~/.bashrc
echo 'export PATH=$M2:$PATH' >> ~/.bashrc
chmod a+x ~/.bashrc
PS1='$ '
source ~/.bashrc
cp /usr/local/apache-maven/apache-maven-3.3.9/bin/mvn /usr/bin/.
cd /root/quorum/NodeManager
mvn -v
mvn clean
mvn install







