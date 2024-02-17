#!/bin/bash

if [ ! "$SCRIPTS_DIR" ]; then
    export SCRIPTS_DIR=/scripts    
fi

chmod +x  ${SCRIPTS_DIR:-/}/*

exec ${SCRIPTS_DIR:-/}/start.sh