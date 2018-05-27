#!/bin/bash
source lib/common.sh

if [ ! -d "../quorum-maker-nodemanager" ]; then
	echo -e "${RED}Source code for NodeManager not found in parent directory. Please clone quorum-maker-nodemanager.${NC}"
	exit 1
fi

rm -rf quorum-maker-nodemanager
cp -r ../quorum-maker-nodemanager quorum-maker-nodemanager

docker run -it --rm \
    -v $(pwd)/quorum-maker-nodemanager:/go/src/github.com/synechron-finlabs/quorum-maker-nodemanager \
    golang:1.10.2 \
    /bin/sh -c 'cd /go/src/github.com/synechron-finlabs/quorum-maker-nodemanager ; go get ./... ; go build'

## Change the owneship of directory
chownDir 'quorum-maker-nodemanager'