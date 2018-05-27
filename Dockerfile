FROM ubuntu:16.04
ADD lib/install_baseimage.sh /root/quorum-maker/install_baseimage.sh
RUN /root/quorum-maker/install_baseimage.sh
#ADD install_languages.sh /root/quorum-maker/install_languages.sh
ADD lib/install_constellation.sh /root/quorum-maker/install_constellation.sh
#RUN chmod +x /root/quorum-maker/*
RUN /root/quorum-maker/install_constellation.sh

ADD quorum/build/bin/geth /usr/local/bin
ADD quorum/build/bin/bootnode /usr/local/bin

ADD quorum-maker-nodemanager/quorum-maker-nodemanager /root/quorum-maker/NodeManager

##ADD build_go.sh /root/quorum-maker/build_go.sh
##RUN chmod +x /root/quorum-maker/build_go.sh
##RUN ./root/quorum-maker/build_go.sh
ADD lib/start_nodemanager.sh /root/quorum-maker/start_nodemanager.sh
RUN chmod +x /root/quorum-maker/start_nodemanager.sh
ADD lib/reset_chain.sh /root/quorum-maker/reset_chain.sh
RUN chmod +x /root/quorum-maker/reset_chain.sh
ADD NetworkManagerContract.sol /root/quorum-maker/NetworkManagerContract.sol
