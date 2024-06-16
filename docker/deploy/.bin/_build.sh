#!/bin/bash

# Build the Docker image
echo "Building Docker image ${IMAGE_NAME}"
docker build $1 -t $IMAGE_NAME .
docker tag $IMAGE_NAME $DOCKERHUB_REPO:$DOCKERHUB_TAG

echo "Container \"$IMAGE_NAME\" has been build and tagged as: \"$DOCKERHUB_REPO:$DOCKERHUB_TAG\""
