#!/usr/bin/env bash
set -euo pipefail

# --- Simple printing helpers ---
guide_print() { printf "%s\n" "$@"; }
guide_hr()    { printf "%s\n" "--------------------------------------------------"; }

# --- Pausing ---
guide_wait()  { read -r -p "Press Enter to continue..." _; }

# --- Guided step ---
guide_step() {
  local title="${1:-}"
  local suggested="${2:-}"
  local check_fn="${3:-}"

  guide_hr
  guide_print "→ ${title}"
  [ -n "${suggested}" ] && guide_print "Try: ${suggested}"
  read -r -p "$ " user_cmd
  if [ -z "${user_cmd// }" ]; then
    user_cmd="${suggested}"
    echo "(auto-running suggested command: ${suggested})"
  fi
  echo
  if ! eval "${user_cmd}"; then
    guide_print "[X] Command failed."
    [ -n "${check_fn}" ] && "${check_fn}" explain || true
    return 1
  fi
  echo
  if [ -n "${check_fn}" ]; then
    if "${check_fn}" verify; then
      guide_print "[OK] That looks correct."
      "${check_fn}" why
      "${check_fn}" success || true
    else
      guide_print "[!] Not quite right."
      "${check_fn}" fix
      return 1
    fi
  fi
  guide_wait
}

# --- Teaching helpers ---
guide_intro()   { echo; guide_hr; echo "📘  INTRO:  $1"; guide_hr; echo; }
guide_syntax()  { echo; echo "💡  SYNTAX: $1"; echo; }
guide_explain() { echo; echo "🧠  EXPLANATION: $1"; echo; }
guide_real()    { echo; echo "🌍  REAL USE: $1"; echo; }
guide_summary() { echo; echo "✅  SUMMARY: $1"; guide_hr; echo; }
