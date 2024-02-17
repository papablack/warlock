FROM runpod/pytorch:2.1.0-py3.10-cuda11.8.0-devel-ubuntu22.04

COPY scripts /scripts
COPY configs /configs

COPY ./entrypoint.sh /scripts/entrypoint.sh
COPY ./requirements.txt /var/requirements.txt

RUN chmod -R 777 /scripts

WORKDIR /var

WORKDIR /scripts

RUN chmod -R 777 /scripts
RUN chmod +x /scripts/*.sh

RUN bash /scripts/install_server.sh
RUN bash /scripts/install.sh
RUN bash /scripts/install_python.sh
# RUN bash /scripts/install_cuda.sh
RUN bash /scripts/install_node.sh
RUN bash /scripts/install_code.sh

ENV GIT_DISCOVERY_ACROSS_FILESYSTEM=1

EXPOSE $LLM_UI_PORT
EXPOSE $LLM_INTERNAL_API_PORT
EXPOSE $JUPYTER_PORT

ENTRYPOINT [ "bash", "/scripts/entrypoint.sh" ]
