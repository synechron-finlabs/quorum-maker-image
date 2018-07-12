#!/bin/bash

source lib/common.sh

if [ ! -d "../quorum-maker-ui" ]; then
	echo -e $RED"Source code for NodeManager UI not found in parent directory. Please clone quorum-maker-ui."$COLOR_END
	exit 1
fi

rm -rf quorum-maker-ui
cp -r ../quorum-maker-ui quorum-maker-ui

pushd quorum-maker-ui > /dev/null

branch=$(git branch | grep \* | cut -d ' ' -f2-)
echo $CYAN"Building QM UI "$branch" ..."$COLOR_END
popd > /dev/null

docker run -it --rm \
    -v $(pwd)/quorum-maker-ui/webApp:/quorum-maker-ui \
    -w /quorum-maker-ui \
    syneblock/cicd \
    /bin/sh -c 'npm install ; ng build --aot'

## Change the owneship of directory
chownDir 'quorum-maker-ui'

echo $CYAN"Building QM UI "$branch" Completed."$COLOR_END