#!/bin/bash
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
cd /root/quorum-maker/NodeManager
mvn -v
mvn clean
mvn install

mv /root/quorum-maker/NodeManager/master_node.sh /root/quorum-maker/.
mv /root/quorum-maker/NodeManager/get_genesis.sh /root/quorum-maker/.
mv /root/quorum-maker/NodeManager/target/nodeManager.jar /root/quorum-maker/.
cd /root/quorum-maker
rm -rf NodeManager







