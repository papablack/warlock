#!/bin/bash
source ./setenv.sh

mkdir -p $LOGDIR
touch $LOGFILE

echo "Start STABLE DIFFUSION"
screen -L -Logfile $LOGFILE -dmS SD bash -c "source venv/bin/activate;python3 launch.py --port 3001 --listen --enable-insecure-extension-access"
