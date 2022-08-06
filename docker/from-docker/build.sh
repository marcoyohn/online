#! /bin/bash

# Check env variables
if [ -z "$DOCKER_HUB_REPO" ]; then
  DOCKER_HUB_REPO="iceinfo/office-online"
fi;
if [ -z "$DOCKER_HUB_TAG" ]; then
  DOCKER_HUB_TAG="latest"
fi;
echo "Using Docker Hub Repository: '$DOCKER_HUB_REPO' with tag '$DOCKER_HUB_TAG'."

HOST_OS="Ubuntu"

SRCDIR=$(realpath `dirname $0`)
INSTDIR="$SRCDIR/instdir"

rm -rf "$INSTDIR" || true
mkdir -p "$INSTDIR"


cp -R ../../../online-branding-iceinfo "$INSTDIR/online-branding-iceinfo"

cp -R ../WindowsFonts "$INSTDIR/WindowsFonts"


docker build --no-cache -t $DOCKER_HUB_REPO:$DOCKER_HUB_TAG -f $HOST_OS . || exit 1

