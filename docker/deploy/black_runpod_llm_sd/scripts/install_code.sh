source ./setenv.sh

export HOME_APP_DIR_LLM=text-generation-webui;
export HOME_APP_DIR_SD=stable-diffusion-webui;

cd /

# if [[ ! -d $ROOT_DIR/$HOME_APP_DIR_LLM ]]; then
    git clone https://github.com/oobabooga/text-generation-webui && \
        cd $HOME_APP_DIR_LLM && \

        python3 -m venv venv
        source venv/bin/activate    
        pip install -r requirements.txt && \
        bash -c 'for req in extensions/*/requirements.txt ; do pip3 install -r "$req" ; done' && \
        #pip3 uninstall -y exllama && \
        mkdir -p repositories && \
        cd repositories && \
        git clone https://github.com/turboderp/exllama && \
        pip install -r exllama/requirements.txt

    chmod -R 777 /${HOME_APP_DIR_LLM}

    cd /text-generation-webui     

    if [[ -f /var/bitsandbytes/.custom-built ]]; then
        pip uninstall bitsandbytes

        mkdir -p /var/bitsandbytes
        cd /var/bitsandbytes
        git clone https://github.com/timdettmers/bitsandbytes.git .
        CUDA_VERSION=123 make cuda12x
        python3 setup.py install
        touch /var/bitsandbytes/.custom-built
    fi
# fi
cd /

# if [[ ! -d $ROOT_DIR/$HOME_APP_DIR_SD ]]; then
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git && \    
        cd $HOME_APP_DIR_SD && \        
        ln -s /sd_extensions.py $HOME_APP_DIR_SD/sd_extensions.py \
        python3 -m venv venv && \
        source venv/bin/activate \
        pip install -r requirements.txt \
        python -c "from sd_extensions import install_extensions; install_extensions()" --skip-torch-cuda-test
        # python -c "from launch import prepare_environment; prepare_environment()" --skip-torch-cuda-test

    # Install DeForum
    cd /$HOME_APP_DIR_SD && \
        git clone https://github.com/deforum-art/sd-webui-deforum extensions/deforum && \
        cd extensions/deforum && \
        pip install -r requirements.txt

    # Install ControlNet
    cd /$HOME_APP_DIR_SD && \
        git clone https://github.com/Mikubill/sd-webui-controlnet.git extensions/sd-webui-controlnet && \
        cd extensions/sd-webui-controlnet && \
        pip install -r requirements.txt \
        pip install torchvision==0.16.0 --extra-index-url https://download.pytorch.org/whl/nightly/cu121;

    # Install the xformers library
    cd /$HOME_APP_DIR_SD && \
        pip install xformers==0.0.22

# fi    