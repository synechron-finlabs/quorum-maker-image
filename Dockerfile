FROM ubuntu:16.04

ADD lib/install_baseimage.sh /root/quorum-maker/install_baseimage.sh
RUN /root/quorum-maker/install_baseimage.sh

ADD lib/install_constellation.sh /root/quorum-maker/install_constellation.sh
RUN /root/quorum-maker/install_constellation.sh

ADD tessera/tessera-app/target/tessera-app.jar /tessera/tessera-app.jar
ADD tessera/data-migration/target/data-migration-cli.jar /tessera/data-migration-cli.jar
ADD tessera/config-migration/target/config-migration-cli.jar /tessera/config-migration-cli.jar

RUN echo "alias tessera=\"java -jar /tessera/tessera-app.jar\"" >> ~/.bashrc
RUN echo "alias tessera-data-migration=\"java -jar /tessera/data-migration-cli.jar\"" >> ~/.bashrc
RUN echo "alias tessera-config-migration=\"java -jar /tessera/config-migration-cli.jar\"" >> ~/.bashrc

ADD quorum/build/bin/geth /usr/local/bin
ADD quorum/build/bin/bootnode /usr/local/bin

ADD quorum-maker-nodemanager/quorum-maker-nodemanager /root/quorum-maker/NodeManager
ADD quorum-maker-ui/webApp/dist /root/quorum-maker/NodeManagerUI/qm

ADD lib/start_nodemanager.sh /root/quorum-maker/start_nodemanager.sh
RUN chmod +x /root/quorum-maker/start_nodemanager.sh

ADD lib/reset_chain.sh /root/quorum-maker/reset_chain.sh
RUN chmod +x /root/quorum-maker/reset_chain.sh

ADD quorum-maker-nodemanager/NetworkManagerContract.sol /root/quorum-maker/NetworkManagerContract.sol
ADD quorum-maker-nodemanager/NodeUnavailableTemplate.txt /root/quorum-maker/NodeUnavailableTemplate.txt
ADD quorum-maker-nodemanager/JoinRequestTemplate.txt /root/quorum-maker/JoinRequestTemplate.txt
ADD quorum-maker-nodemanager/TestMailTemplate.txt /root/quorum-maker/TestMailTemplate.txt
ADD quorum-maker-nodemanager/nmcBytecode /root/quorum-maker/nmcBytecode
