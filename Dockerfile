FROM ubuntu:16.04
#ADD install_baseimage.sh /root/quorum/install_baseimage.sh
#ADD install_languages.sh /root/quorum/install_languages.sh
#ADD install_quorum.sh /root/quorum/install_quorum.sh
#ADD install_All.sh /root/quorum/install_All.sh
#RUN chmod +x /root/quorum/*
#RUN ./root/quorum/install_All.sh
ADD NodeManager /root/quorum/NodeManager
ADD build_java.sh /root/quorum/build_java.sh
RUN chmod +x /root/quorum/build_java.sh
Run ./root/quorum/build_java.sh



