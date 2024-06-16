# Configuration file for jupyter-notebook.
import os

c = get_config()  #noqa

c.ServerApp.root_dir = os.environ['ROOT_DIR']

c.ServerApp.preferred_dir = os.environ['ROOT_DIR'] + '/notebooks'
c.ServerApp.password = "argon2:$argon2id$v=19$m=10240,t=10,p=8$5EhWSkIiC66sLfTyHJU/sw$KO9nIbqk6615GcLUk8tFeeqg7kBvuHmdlUev0Wz+tTU" # "pass123"

c.ServerApp.port = os.environ['JUPYTER_PORT']
c.ServerApp.ip = '*'

# Disable the automatic opening of the web browser
c.NotebookApp.open_browser = False

# Allow running Jupyter as root
c.ServerApp.allow_root = True

# Set terminado settings for shell access
c.ServerApp.terminado_settings = {'shell_command': ['/bin/bash']}

# Allow connections from any origin
c.ServerApp.allow_origin = '*'
