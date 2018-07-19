#!/bin/bash

source qm.variables
source lib/common.sh 

echo $CYAN"Building Quorum, "$quorum_version"..."$COLOR_END

rm -rf quorum

docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git alpine/git clone https://github.com/jpmorganchase/quorum.git
docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git -w /git/quorum alpine/git checkout $quorum_version
cd $(pwd)/quorum
sed -i 's/GasLimitBoundDivisor   = big.NewInt(1024)/GasLimitBoundDivisor   = big.NewInt(4096)/' params/protocol_params.go
sed -i 's/MinGasLimit            = big.NewInt(5000)/MinGasLimit            = big.NewInt(700000000)/' params/protocol_params.go
sed -i 's/GenesisGasLimit        = big.NewInt(4712388)/GenesisGasLimit        = big.NewInt(800000000)/' params/protocol_params.go
sed -i 's/QuorumVersionPatch = 1/QuorumVersionPatch = 2/' params/version.go
cd ..
docker run -it --rm -v $(pwd)/quorum:/quorum -w /quorum golang:1.10.2 make all

## Change the owneship of quorum directory
chownDir 'quorum'

echo $CYAN"Building Quorum, "$quorum_version" Completed."$COLOR_END
