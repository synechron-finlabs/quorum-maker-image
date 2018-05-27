
RED='\033[0;31m'
NC='\033[0m' # No Color

function chownDir {
    docker run -it --rm -v $(pwd)/$1:/$1 -w / -e QUID=$UID -e QGID=$(id -g $USER) golang:1.10.2 /bin/sh -c 'chown -R $QUID:$QGID '$1
}