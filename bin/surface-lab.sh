#!/usr/bin/env bash
# shellcheck disable=SC1091

set -euo pipefail

# --- Imports ---
source "$(dirname "$0")/../lib/logger.sh"
source "$(dirname "$0")/../core/missions.sh"
source "$(dirname "$0")/../core/env.sh"

# --- Error and interrupt handling ---
trap 'log_error "Script failed at line $LINENO. Exiting."' ERR
trap 'log_info "User interrupted with Ctrl+C"; exit 1' SIGINT

# --- Main logic ---
main() {
    log_info "Starting surface-lab"
    log_info "Running mission..."
    sleep 1
    log_success "Mission completed successfully."
}

main "$@"

