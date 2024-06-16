#!/bin/bash

[Unit]
Description=__SERVICE_NAME__

[Service]
Type=simple
PIDFile=/run/jupyter.pid
ExecStart=__SERVICE_CMD__
ExecSTOP=__SERVICE_STOP_CMD__


[Install]
WantedBy=multi-user.target