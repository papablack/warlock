#!/bin/bash
source ./setenv.sh



if [[ $PUBLIC_KEY ]]; then
    echo "Setting up SSH..."
    mkdir -p ~/.ssh
    echo "$PUBLIC_KEY" >> ~/.ssh/authorized_keys
    chmod 700 -R ~/.ssh   
    # service ssh start
fi

# service nginx start

mkdir -p $ROOT_DIR/notebooks
bash /scripts/jupyter_start.sh

chmod -R 777 $ROOT_DIR
cd $ROOT_DIR
if [[ $SYNC_WORKSPACE == 1 ]]; then    
    rsync --update -av -r /text-generation-webui $ROOT_DIR

    # source venv/bin/activate

    # pip install -r requirements.txt
    # pip install -r extensions/openai/requirements.txt --upgrade        

    rsync --update -av -r /stable-diffusion-webui $ROOT_DIR

    # source venv/bin/activate

    # pip install -r requirements.txt
    # pip uninstall torchvision
    # pip install torchvision==0.16.0 --extra-index-url https://download.pytorch.org/whl/nightly/cu121
fi

if [[ -d $ROOT_DIR/text-generation-webui ]]; then
    cd $ROOT_DIR/text-generation-webui   
else    
    cd /text-generation-webui
fi   


# If passed a MODEL variable from Runpod template, start it downloading
# This will block the UI until completed
# MODEL can be a HF repo name, eg 'TheBloke/guanaco-7B-GPTQ'
# or it can be a direct link to a single GGML file, eg 'https://huggingface.co/TheBloke/tulu-7B-GGML/resolve/main/tulu-7b.ggmlv3.q2_K.bin'
if [[ $MODEL ]]; then
    ./fetch-model.py "$MODEL" $ROOT_DIR/text-generation-webui/models >> $ROOT_DIR/text-generation-webui/logs/fetch-model.log 2>&1
fi

source venv/bin/activate    

bash /scripts/run_llm.sh 

if [[ -d $ROOT_DIR/stable-diffusion-webui ]]; then
    cd $ROOT_DIR/stable-diffusion-webui    
else
    /stable-diffusion-webui
fi

source venv/bin/activate

bash /scripts/run_sd.sh   

echo "Tailing $LOGFILE"
tail -f $LOGFILE

while true; do sleep 5 ; done;