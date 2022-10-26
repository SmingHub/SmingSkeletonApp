#!/usr/bin/env bash

set -e

source /opt/sming/Tools/export.sh
make

if [ "${USER}" == "gitpod" ];then
    gp_url=$(gp url 9012)
    echo "gp_url=${gp_url}"
    export WOKWI_HOST=${gp_url:8}
elif [ "${CODESPACE_NAME}" != "" ];then
    export WOKWI_HOST=${CODESPACE_NAME}-9012.githubpreview.dev
fi
# Choose ESP_BOARD: [esp32, esp32c3, esp32s2, esp32s3]
export ESP_BOARD="esp32"
export WOKWI_PROJECT_ID=""
export APP_BIN=out/Esp32/${ESP_BOARD}/debug/firmware/app.bin
if [ "${WOKWI_PROJECT_ID}" == "" ]; then
    wokwi-server --chip ${ESP_BOARD} ${APP_BIN}
else
    wokwi-server --chip ${ESP_BOARD} --id ${WOKWI_PROJECT_ID} ${APP_BIN}
fi
