#!/bin/bash

set -x 

source lib/common.sh 

rm -rf quorum

docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git alpine/git clone https://github.com/jpmorganchase/quorum.git
docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git -w /git/quorum alpine/git checkout v2.0.2
docker run -it --rm -v $(pwd)/quorum:/quorum -w /quorum golang:1.10.2 make all

## Change the owneship of quorum directory
chownDir 'quorum'