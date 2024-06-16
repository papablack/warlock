#!/bin/bash
source ./setenv.sh

echo "Jupyter Lab starting"

screen -dmS JUPYTER bash -c 'jupyter lab --ServerApp.token=$JUPYTER_PASSWORD'