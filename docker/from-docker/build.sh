#! /bin/bash

# Check env variables
if [ -z "$DOCKER_HUB_REPO" ]; then
  DOCKER_HUB_REPO="iceinfo/office-online"
fi;
if [ -z "$DOCKER_HUB_TAG" ]; then
  DOCKER_HUB_TAG="latest"
fi;
echo "Using Docker Hub Repository: '$DOCKER_HUB_REPO' with tag '$DOCKER_HUB_TAG'."

if [ -z "$(lsb_release -si)" ]; then
  echo "WARNING: Unable to determine your distribution"
  echo "(Is lsb_release installed?)"
  echo "Using Ubuntu Dockerfile."
  HOST_OS="Ubuntu"
else
  HOST_OS=$(lsb_release -si)
fi

mkdir -p ./online-branding-iceinfo/iceinfo
rm -rf ./online-branding-iceinfo/iceinfo/*

cp -R ../../../online-branding-iceinfo/iceinfo/* ./online-branding-iceinfo/iceinfo/


docker build --no-cache -t $DOCKER_HUB_REPO:$DOCKER_HUB_TAG -f $HOST_OS . || exit 1

