#!/usr/bin/env bash

set -e

source /opt/sming/Tools/export.sh
make
# Choose ESP_BOARD: [esp32, esp32c3, esp32s2, esp32s3]
export ESP_BOARD="esp32"
web-flash --chip ${ESP_BOARD} out/Esp32/${ESP_BOARD}/debug/firmware/app.bin
