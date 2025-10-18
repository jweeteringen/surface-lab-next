#!/usr/bin/env bash
set -euo pipefail
source "$PROJECT_ROOT/core/guide.sh"

mkdir_validator() {
  case "${1:-}" in
    verify) [ -d testfolder ];;
    why) guide_print "mkdir creates directories. We expected to find a folder named testfolder after you ran the command.";;
    fix) guide_print "Try again with: mkdir testfolder";;
    explain) guide_print "This validator checks that a new directory named testfolder exists.";;
    success) guide_explain "Perfect — testfolder now exists! That’s your newly created directory. You can list it with ls or remove it later with rmdir testfolder.";;
  esac
}

guide_intro "mkdir (make directory) creates new folders on your system."
guide_syntax "mkdir <foldername>   →   mkdir testfolder"
guide_step "Create a folder named testfolder" "mkdir testfolder" mkdir_validator
guide_real "You’ll use mkdir whenever you start a new project or want to organize files. It’s one of the first building blocks of Linux navigation."
guide_summary "You learned mkdir: it creates directories so you can organize your filesystem. Next you’ll learn to move into that folder with cd."
