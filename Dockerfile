FROM ubuntu:16.04
ADD install_quorum.sh /root/quorum/install_quorum.sh
RUN chmod +x /root/quorum/install_quorum.sh
RUN ./root/quorum/install_quorum.sh
ADD build_java.sh /root/quorum/build_java.sh
Run ./root/quorum/build_java.sh


