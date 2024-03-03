#!/bin/bash

if [ ! "$SCRIPTS_DIR" ]; then
    export SCRIPTS_DIR=/scripts    
fi

chmod -R +x  ${SCRIPTS_DIR}

exec ${SCRIPTS_DIR}/start.sh