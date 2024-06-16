#!/bin/bash
source ./setenv.sh

export SD_PORT=8889
export LLM_PORT=8890

apt update

apt-get install -y software-properties-common apt-utils rsync
apt-get install -y git curl wget nano zip unzip libgoogle-perftools-dev screen nginx

cd /var

echo "Python 3.10 and pip installation complete."

pip install wheel
pip install jupyterlab

mkdir -p $ROOT_DIR/notebooks

mkdir -p /root/.jupyter/
rm /root/.jupyter/jupyter_notebook_config.py
cp /configs/jupyter-lab/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py