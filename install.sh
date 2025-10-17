#!/usr/bin/env bash

set -euo pipefail

APP_NAME="surface-lab"
INSTALL_PATH="/usr/local/bin"
SCRIPT_SOURCE="bin/surface-lab.sh"
SCRIPT_TARGET="$INSTALL_PATH/$APP_NAME"

# Check dependencies
if [[ ! -f "$SCRIPT_SOURCE" ]]; then
  echo "[ERROR] Cannot find $SCRIPT_SOURCE"
  exit 1
fi

# Make sure script is executable
chmod +x "$SCRIPT_SOURCE"

# Create symlink
sudo ln -sf "$(pwd)/$SCRIPT_SOURCE" "$SCRIPT_TARGET"

echo "[OK] Installed '$APP_NAME' globally."
echo "You can now run it anywhere using: $APP_NAME"
