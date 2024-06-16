#!/bin/bash

# SET ENV VARS
# ________________
source ./setenv.sh

$WORKSPACE=$ROOT_DIR

cd /app

echo -= Install PIP dependencies =-
pip3 install accelerate
# pip3 install einops transformers>=4.25.1 safetensors>=0.3.0 aiohttp pyyaml Pillow scipy psutil
# pip3 install torchsde
# pip3 install kornia>=0.7.1 spandrel
pip3 install tqdm

# # ComfyUI-Manager install
# # _______________________

# cd $APPZ_DIR

# # Correction of the issue of permissions being deleted on Google Drive.
# [ -f "ComfyUI-Manager/check.sh" ] && chmod 755 ComfyUI-Manager/check.sh
# [ -f "ComfyUI-Manager/scan.sh" ] && chmod 755 ComfyUI-Manager/scan.sh
# [ -f "ComfyUI-Manager/node_db/dev/scan.sh" ] && chmod 755 ComfyUI-Manager/node_db/dev/scan.sh
# [ -f "ComfyUI-Manager/scripts/install-comfyui-venv-linux.sh" ] && chmod 755 ComfyUI-Manager/scripts/install-comfyui-venv-linux.sh
# [ -f "ComfyUI-Manager/scripts/install-comfyui-venv-win.bat" ] && chmod 755 ComfyUI-Manager/scripts/install-comfyui-venv-win.bat

# [ ! -d ComfyUI-Manager ] && echo -= Initial setup ComfyUI-Manager =- && git clone https://github.com/ltdrdata/ComfyUI-Manager

# cd $COMFY_MANAGER_DIR

# git pull

# cd $COMFY_DIR

# echo -= Install custom nodes dependencies =-
# pip install GitPython
# python custom_nodes/ComfyUI-Manager/cm-cli.py restore-dependencies

# # Custom ComfyUI nodes install
# # ____________________________

# cd custom_nodes

# custom_node_repos=(
#     "https://github.com/XmYx/deforum-comfy-nodes.git"
#     "https://github.com/rgthree/rgthree-comfy"
#     "https://github.com/a1lazydog/ComfyUI-AudioScheduler"
#     "https://github.com/cubiq/ComfyUI_IPAdapter_plus"
#     "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite"
#     "https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet"
#     "https://github.com/WASasquatch/was-node-suite-comfyui"
#     "https://github.com/11cafe/comfyui-workspace-manager"
#     "https://github.com/cubiq/ComfyUI_essentials"
#     "https://github.com/FizzleDorf/ComfyUI_FizzNodes"
#     "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
#     "https://github.com/Fannovel16/ComfyUI-Frame-Interpolation"
#     "https://github.com/Fannovel16/ComfyUI-Video-Matting"
#     "https://github.com/crystian/ComfyUI-Crystools"
# )

# for repo in "${custom_node_repos[@]}"; do
#     git clone "$repo"
# done