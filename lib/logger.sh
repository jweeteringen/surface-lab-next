#!/usr/bin/env bash

LOG_FILE="./logs/surface-lab.log"
mkdir -p "$(dirname "$LOG_FILE")"

log_info()    { echo "[INFO]  $*" | tee -a "$LOG_FILE"; }
log_warn()    { echo "[WARN]  $*" | tee -a "$LOG_FILE"; }
log_error()   { echo "[ERROR] $*" | tee -a "$LOG_FILE"; }
log_success() { echo "[ OK ]  $*" | tee -a "$LOG_FILE"; }
