#!/bin/bash
source lib/common.sh

if [ ! -d "../quorum-maker-ui" ]; then
	echo -e "${RED}Source code for NodeManager UI not found in parent directory. Please clone quorum-maker-ui.${NC}"
	exit 1
fi

rm -rf quorum-maker-ui
cp -r ../quorum-maker-ui quorum-maker-ui

docker run -it --rm \
    -v $(pwd)/quorum-maker-ui/webApp:/quorum-maker-ui \
    -w /quorum-maker-ui \
    syneblock/cicd \
    /bin/sh -c 'npm install ; ng build'

## Change the owneship of directory
chownDir 'quorum-maker-ui'