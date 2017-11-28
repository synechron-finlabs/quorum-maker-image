#!/bin/bash

#this is for quorum and constellation installation tag of focker image syneblock/quorum-master:quorum2.0.0

git clone https://github.com/jpmorganchase/quorum.git
cd quorum
git checkout v2.0.0
make all
cp build/bin/geth /usr/local/bin
cp build/bin/bootnode /usr/local/bin

wget https://github.com/jpmorganchase/constellation/releases/download/v0.2.0/constellation-0.2.0-ubuntu1604.tar.xz
tar -xf constellation-0.2.0-ubuntu1604.tar.xz
cp constellation-0.2.0-ubuntu1604/constellation-node /usr/bin/.



