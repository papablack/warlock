#!/bin/bash

# Define the image name
IMAGE_NAME="thepapablack/black_gen_ai_base:full"

# Build the Docker image
echo "Building Docker image..."
docker build -t $IMAGE_NAME .

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Docker image built successfully."

    # Push the Docker image to Docker Hub (or your preferred registry)
    echo "Pushing Docker image to Docker Hub..."
    docker push $IMAGE_NAME

    if [ $? -eq 0 ]; then
        echo "Docker image pushed successfully."
    else
        echo "Failed to push Docker image."
    fi
else
    echo "Failed to build Docker image."
fi
