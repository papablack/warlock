#!/bin/bash
# Edit these arguments if you want to customise text-generation-webui launch.
# Don't remove "$@" from the start unless you want to prevent automatic model loading from template arguments
ARGS=("$@" --listen --api)

echo "Launching text-generation-webui with args: ${ARGS[@]}"

python3 server.py "${ARGS[@]}"