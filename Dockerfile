FROM ubuntu:16.04
ADD install_quorum.sh /root/install_quorum.sh
RUN chmod +x /root/install_quorum.sh
RUN ./root/install_quorum.sh


