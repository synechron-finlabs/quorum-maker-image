Instructions for Docker creation:

1)DockerFile will add install_baseimages.sh, install_languages.sh, install_quorum.sh, install_all.sh shell scripts into docker image.
2) install_baseimages.sh contains commands to install basic utilities needed for smooth usage of ubuntu. So, if you want ubuntu 16.04 image with utilies with wget,curl,nano,telnet then replace change script to be executed from install_quorum.sh to install_baseimage.sh
Ex. replace "RUN ./root/quorum/install_All.sh"  with "RUN ./root/quorum/install_baseimage.sh"
3) install_languages.sh has setup of go-lang as well nodejs(npm included). I f you want ubuntu and one of these languages then use this script instead of install_quorum.sh
4) install_quorum.sh will install quorum on top all that is already install in above 2 shell scripts.
5) DockerFile will also add and execute build_java.sh script.
6) build_java.sh installs open-jdk8 and mvn, sets environment variable and create nodemanager.jar inside docker image and also provides master_node.sh shell script to be used when you fire up container using this image.