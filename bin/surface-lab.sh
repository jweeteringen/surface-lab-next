#!/usr/bin/env bash

set -euo pipefail

source "$(dirname "$0")/../lib/logger.sh"

trap 'log_error "Script failed at line $LINENO. Exiting."' ERR
trap 'log_info "User interrupted with Ctrl+C"; exit 1' SIGINT

main() {
    log_info "Starting surface-lab"
    log_info "Running mission..."
    sleep 1
    log_success "Mission completed successfully."
}

main "$@"
