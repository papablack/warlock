#!/bin/bash

# Ensure we have /workspace in all scenarios
mkdir -p /workspace

if [[ ! -d $ROOT_DIR/text-generation-webui ]]; then
	# If we don't already have /workspace/text-generation-webui, move it there
	mv /text-generation-webui /$ROOT_DIR
else
	# otherwise delete the default text-generation-webui folder which is always re-created on pod start from the Docker
	rm -rf /text-generation-webui
fi

