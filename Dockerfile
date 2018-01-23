FROM ubuntu:16.04
ADD install_baseimage.sh /root/quorum-maker/install_baseimage.sh
ADD install_languages.sh /root/quorum-maker/install_languages.sh
ADD install_quorum.sh /root/quorum-maker/install_quorum.sh
RUN chmod +x /root/quorum-maker/*
RUN ./root/quorum-maker/install_quorum.sh
ADD NodeManager /root/quorum-maker/NodeManager
ADD build_java.sh /root/quorum-maker/build_java.sh
RUN chmod +x /root/quorum-maker/build_java.sh
RUN ./root/quorum-maker/build_java.sh
ADD NodeManagerGo /root/go/src/synechron.com/NodeManagerGo
ADD build_go.sh /root/quorum-maker/build_go.sh
RUN chmod +x /root/quorum-maker/build_go.sh
RUN ./root/quorum-maker/build_go.sh
ADD start_nodemanager.sh /root/quorum-maker/start_nodemanager.sh
RUN chmod +x /root/quorum-maker/start_nodemanager.sh