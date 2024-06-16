#!/bin/bash

source ./setenv.sh

SCRIPTDIR=$SCRIPTS_DIR
VOLUME=$ROOT_DIR

# Start jupyter lab

mkdir -p $ROOT_DIR/notebooks

# If a volume is already defined, $VOLUME will already exist
# If a volume is not being used, we'll still use /worksapce to ensure everything is in a known place.
mkdir -p /logs


clear

echo "SSH is set up."

pip install --upgrade notebook
pip install --upgrade jupyterlab
