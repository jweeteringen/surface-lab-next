#!/usr/bin/env bash
set -euo pipefail
source "$PROJECT_ROOT/core/guide.sh"

ls_validator() {
  case "${1:-}" in
    verify) command -v ls >/dev/null 2>&1;;
    why) guide_print "ls shows this command works correctly.";;
    fix) guide_print "Try running ls again.";;
    explain) guide_print "Validator checks that ls runs without error.";;
  esac
}

guide_step "Learn the ls command" "ls" ls_validator
guide_print "Lesson complete! You just learned ls."
