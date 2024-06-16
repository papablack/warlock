#!/bin/bash
source /scripts/setenv.sh

echo "Jupyter Lab starting"

screen -dmS JUPYTER bash -c 'jupyter lab --ServerApp.token=$JUPYTER_PASSWORD --allow-root -ip=0.0.0.0 --port=$JUPYTER_PORT'