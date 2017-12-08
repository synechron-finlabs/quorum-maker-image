FROM ubuntu:16.04
ADD install_baseimage.sh /home/quorum-maker/install_baseimage.sh
ADD install_languages.sh /home/quorum-maker/install_languages.sh
ADD install_quorum.sh /home/quorum-maker/install_quorum.sh
RUN chmod +x /home/quorum-maker/*
RUN ./home/quorum-maker/install_quorum.sh
ADD NodeManager /home/quorum-maker/NodeManager
ADD build_java.sh /home/quorum-maker/build_java.sh
RUN chmod +x /home/quorum-maker/build_java.sh
Run ./home/quorum-maker/build_java.sh



