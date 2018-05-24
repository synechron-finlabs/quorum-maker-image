FROM ubuntu:16.04
ADD install_baseimage.sh /root/quorum-maker/install_baseimage.sh
ADD install_languages.sh /root/quorum-maker/install_languages.sh
ADD install_quorum.sh /root/quorum-maker/install_quorum.sh
RUN chmod +x /root/quorum-maker/*
RUN ./root/quorum-maker/install_quorum.sh
ADD NodeManagerGo /root/go/src/synechron.com/NodeManagerGo
ADD build_go.sh /root/quorum-maker/build_go.sh
RUN chmod +x /root/quorum-maker/build_go.sh
RUN ./root/quorum-maker/build_go.sh
ADD start_nodemanager.sh /root/quorum-maker/start_nodemanager.sh
RUN chmod +x /root/quorum-maker/start_nodemanager.sh
ADD reset_chain.sh /root/quorum-maker/reset_chain.sh
RUN chmod +x /root/quorum-maker/reset_chain.sh
ADD NetworkManagerContract.sol /root/quorum-maker/NetworkManagerContract.sol
