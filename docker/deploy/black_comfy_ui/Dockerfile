FROM thecooltechguy/comfyui_launcher:latest

COPY scripts /scripts
COPY configs /configs
COPY notebooks ${ROOT_DIR}/notebooks

COPY ./entrypoint.sh /scripts/entrypoint.sh
# COPY ./requirements.txt /var/requirements.txt

RUN chmod -R 777 /scripts
RUN chmod -R 777 ${ROOT_DIR}/notebooks

WORKDIR /var

WORKDIR /scripts

COPY ./configs/comfyui-launcher/launcher.json /app/server/launcher.json
# COPY ./configs/comfyui-launcher/config.json /app/server/config.json

RUN chmod -R 777 /configs

RUN chmod -R 777 /scripts
RUN chmod +x /scripts/*.sh

RUN bash /scripts/install_server.sh
RUN bash /scripts/install_node.sh
RUN bash /scripts/install_jupyter.sh
RUN bash /scripts/install_code.sh

ENV GIT_DISCOVERY_ACROSS_FILESYSTEM=1

# Set environment variables with default values

ENV ROOT_DIR /workspace
ENV APPZ_DIR ${ROOT_DIR}/appz

RUN mkdir -p ${APPZ_DIR}
RUN chmod -R 777 ${APPZ_DIR}

ENV VSCODE_RANGE_START 8000
ENV VSCODE_RANGE_END 9000
ENV COMFY_PROJECTS_RANGE_START 4001
ENV COMFY_PROJECTS_RANGE_END 4010
ENV COMFY_PORT 4000
ENV JUPYTER_PORT 8888

ENV COMFY_DATA_DIR $ROOT_DIR/comfy-ui-data

RUN mkdir -p ${COMFY_DATA_DIR}
RUN mkdir -p ${COMFY_DATA_DIR}/models
RUN mkdir -p ${COMFY_DATA_DIR}/templates

RUN chmod -R 777 ${COMFY_DATA_DIR}

ENV COMFY_LAUNCHER_DIR /app
ENV COMFY_MODELS_DIR ${COMFY_DATA_DIR}/models
ENV COMFY_TEMPLATES_DIR ${COMFY_DATA_DIR}/templates

ENV PROJECT_MIN_PORT $COMFY_PROJECTS_RANGE_START
ENV PROJECT_MAX_PORT $COMFY_PROJECTS_RANGE_END
ENV SERVER_PORT $COMFY_PORT

ENV PROJECTS_DIR $APPZ_DIR/comfy-projects

ENV MODELS_DIR $COMFY_MODELS_DIR
ENV TEMPLATES_DIR $COMFY_TEMPLATES_DIR

ENV CELERY_BROKER_URL='filesystem://localhost//'
ENV CELERY_RESULT_BACKEND='file://.celery/results'
ENV CELERY_RESULTS_DIR='/.celery/results'
ENV CELERY_BROKER_CONNECTION_RETRY_ON_STARTUP=True

# Expose the port ranges and specific ports
EXPOSE ${VSCODE_RANGE_START}-${VSCODE_RANGE_END}
EXPOSE ${COMFY_PROJECTS_RANGE_START}-${COMFY_PROJECTS_RANGE_END}
EXPOSE ${COMFY_PORT}
EXPOSE ${JUPYTER_PORT}

WORKDIR ${COMFY_LAUNCHER_DIR}/server

ENTRYPOINT [ "bash", "/scripts/entrypoint.sh" ]
