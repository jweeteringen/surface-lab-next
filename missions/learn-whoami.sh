#!/usr/bin/env bash
set -euo pipefail
source "$PROJECT_ROOT/core/guide.sh"

whoami_validator() {
  case "${1:-}" in
    verify) command -v whoami >/dev/null 2>&1;;
    why) guide_print "whoami shows this command works correctly.";;
    fix) guide_print "Try running whoami again.";;
    explain) guide_print "Validator checks that whoami runs without error.";;
  esac
}

guide_step "Learn the whoami command" "whoami" whoami_validator
guide_print "Lesson complete! You just learned whoami."
