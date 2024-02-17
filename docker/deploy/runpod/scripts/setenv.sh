#!/bin/bash

if [ ! "$ROOT_DIR" ]; then
    export ROOT_DIR=/
    mkdir -p $ROOT_DIR;
fi

if [ ! "$WORKSPACED" ]; then
    export WORKSPACED=0
fi

if [ ! "$SYNC_WORKSPACE" ]; then
    export SYNC_WORKSPACE=0
fi

if [ ! "$SCRIPTS_DIR" ]; then
    export SCRIPTS_DIR=/scripts    
fi

if [ ! "$LLM_INTERNAL_PORT" ]; then
    export LLM_INTERNAL_PORT=5000
fi

if [ ! "$LLM_UI_WEB_PORT" ]; then
    export LLM_UI_WEB_PORT=7860
fi

if [ ! "$JUPYTER_WEB_PORT" ]; then
    export JUPYTER_WEB_PORT=8888
fi


if [ ! "$GPU_INDEX" ]; then
    export GPU_INDEX=0
fi

if [ ! "$LOGDIR" ]; then
    export LOGDIR=/var/log
fi

if [ ! "$LOGFILE" ]; then
    export LOGFILE="$LOGDIR/main.log"
fi

#pass123
export JUPYTER_APP_PASSWORD="argon2:\$argon2id\$v=19\$m=10240,t=10,p=8\$0j8vTvzDynB6EULSmgbDZA\$5MgB2ZHTKyY2E5sY7eF0gizLWvACFdyLOcmOsOpmv9Q"

export VENV_DIR=$ROOT_DIR/venv
export venv_dir=$VENV_DIR


#export LD_PRELOAD="/usr/lib/libtcmalloc.so"

# Execute script if exists
execute_script() {
    local script_path=$1
    local script_msg=$2
    if [[ -f ${script_path} ]]; then
        echo "${script_msg}"
        bash ${script_path}
    fi
}

# Export env vars
export_env_vars() {
    echo "Exporting environment variables..."
    printenv | grep -E '^RUNPOD_|^PATH=|^_=' | awk -F = '{ print "export " $1 "=\"" $2 "\"" }' >> /etc/rp_environment
    echo 'source /etc/rp_environment' >> ~/.bashrc
}
