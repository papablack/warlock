#!/bin/bash

set -e

if [ ! -d .bin ]; then
    echo "Run command from dir that contains the .bin directory"
    exit 1
fi

source ./.bin/_env.sh

# Check if the first argument is provided
if [ -z "$1" ]; then
    echo "Error: No docker directory provided."
    echo "Usage: $0 black_comfy_ui"
    exit 1
fi

cd $1

bash ../.bin/_build.sh $2

cd ..

bash .bin/run.sh $1
