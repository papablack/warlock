#!/bin/bash

set -e

if [ ! -d .bin ]; then
    echo "Run command from dir that contains the .bin directory"
    exit 1
fi

source ./.bin/_env.sh

docker push $DOCKERHUB_REPO:$DOCKERHUB_TAG

echo "Container \"$IMAGE_NAME\" has been pushed to \"$DOCKERHUB_REPO:$DOCKERHUB_TAG\""
