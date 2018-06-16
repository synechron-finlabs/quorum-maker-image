#!/bin/bash

imagename="syneblock/quorum-maker"

if [ ! -z "$1" ]; then
    imagename=$1
fi

if [ ! -z "$2" ]; then
    tagname=$2
else 

    branch=$(git branch | grep \* | cut -d ' ' -f2-)

    if [ $branch = "development" ]; then
        tagname="2.0.2_Dev"
    elif [ $branch = "master" ]; then
        tagname="2.0.2"
    elif [[ $branch == V* ]] || [[ $branch == v* ]]; then
            tagname="2.0.2_"$(echo $branch | cut -c 2-)
    else
            tagname="2.0.2_"$branch
    fi
fi

dockername=$imagename":"$tagname
echo "Building image, "$dockername"..."

exit

lib/install_quorum.sh
lib/build_nodemanager.sh
lib/build_ui.sh


docker build --no-cache -t $dockername .
