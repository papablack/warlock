#!/bin/bash
source ./setenv.sh
pkill -f "jupyter-lab"
if [[ $JUPYTER_PASSWORD ]]; then    
    mkdir -p $ROOT_DIR 
    cd /        
    nohup jupyter lab --ServerApp.token=$JUPYTER_PASSWORD &> /jupyter.log &
        
    echo "Jupyter Lab started"
else
    echo "No \$JUPYTER_PASSWORD"
fi
