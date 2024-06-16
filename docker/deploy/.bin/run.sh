#!/bin/bash

set -e

if [ ! -d .bin ]; then
    echo "Run command from dir that contains the .bin directory"
    exit 1
fi

source ./.bin/_env.sh

# Check if the container is already running
if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
    echo "Stopping and removing existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Run the Docker container
echo "Running Docker container ${CONTAINER_NAME} ..."
docker run -it --name=${CONTAINER_NAME} --env-file .env -p 8000-9000:8000-9000 -p 4000-4010:4000-4010 -v ./workspace:/workspace ${CONTAINER_NAME}

echo "Container $CONTAINER_NAME is running on port $PORT"
