#!/bin/bash
source /workspace/StableDiffusion/scripts/setenv.sh

# Define the path to your Jupyter configuration file
jupyter_config_file="$HOME/.jupyter/jupyter_notebook_config.py"

# Check if the config file already exists
if [ -f "$jupyter_config_file" ]; then
  echo "Updating existing Jupyter configuration file..."
else
  echo "Creating a new Jupyter configuration file..."
  jupyter notebook --generate-config
fi

# Set the Jupyter password in the configuration file
echo "c.NotebookApp.password = '$JUPYTER_PASSWORD'" >> "$jupyter_config_file"
echo "c.NotebookApp.allow_root = True" >> "$jupyter_config_file"
echo "c.NotebookApp.open_browser = False" >> "$jupyter_config_file"
echo "c.NotebookApp.port = $JUPYTER_WEB_PORT" >> "$jupyter_config_file"
echo "c.NotebookApp.ip = '*'" >> "$jupyter_config_file"
echo "c.ServerApp.terminado_settings = {'shell_command': ['/bin/bash']}" >> "$jupyter_config_file"
echo "c.ServerApp.allow_origin = '*'" >> "$jupyter_config_file"
echo "c.ServerApp.preferred_dir = '$ROOT_DIR/notebooks'" >> "$jupyter_config_file"


echo "Jupyter password set in the configuration file: $jupyter_config_file"
