#!/bin/bash
source ./setenv.sh

apt update

apt-get install -y software-properties-common apt-utils rsync
apt-get install -y git curl wget nano zip unzip libgoogle-perftools-dev screen nginx

cd /var

echo "pip installation complete."

pip install wheel

