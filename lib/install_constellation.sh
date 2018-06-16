#!/bin/bash

wget https://github.com/jpmorganchase/constellation/releases/download/v0.3.2/constellation-0.3.2-ubuntu1604.tar.xz
tar -xf constellation-0.3.2-ubuntu1604.tar.xz
cp constellation-0.3.2-ubuntu1604/constellation-node /usr/bin/.
cd ..

rm -rf go1.10.linux-amd64.tar.gz