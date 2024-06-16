#!/bin/bash

source ./setenv.sh

SCRIPTDIR=$SCRIPTS_DIR
VOLUME=$ROOT_DIR

# Start jupyter lab

mkdir -p $ROOT_DIR/notebooks
mkdir -p /logs

clear

echo "SSH is set up."

pip install --upgrade notebook
pip install --upgrade jupyterlab

mkdir -p /root/.jupyter/

cp /configs/jupyter-lab/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py