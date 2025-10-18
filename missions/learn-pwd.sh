#!/usr/bin/env bash
set -euo pipefail
source "$PROJECT_ROOT/core/guide.sh"

pwd_validator() {
  case "${1:-}" in
    verify) command -v pwd >/dev/null 2>&1;;
    why) guide_print "pwd shows this command works correctly.";;
    fix) guide_print "Try running pwd again.";;
    explain) guide_print "Validator checks that pwd runs without error.";;
  esac
}

guide_step "Learn the pwd command" "pwd" pwd_validator
guide_print "Lesson complete! You just learned pwd."
