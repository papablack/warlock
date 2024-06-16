#!/bin/bash
source ./setenv.sh

mkdir -p $LOGDIR
touch $LOGFILE

echo "Start TEXT GENERATION WEBUI"
screen -L -Logfile $LOGFILE -dmS LLM bash -c "source venv/bin/activate;bash /scripts/run-text-generation-webui.sh"