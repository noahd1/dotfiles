#!/bin/bash

function ssht() {
  ssh -t gw ssh -At $@
}

function fancy_shell_prompt {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local     DEFAULT="\[\033[0;39m\]"
PS1="$BLUE[$RED\$(rbenv version-name)$BLUE]$BLUE[$RED\$(date +%H:%M)$BLUE]\
$BLUE[$RED\w$GREEN\$(__git_ps1)$BLUE]\
$GREEN\$$DEFAULT "
PS2='> '
PS4='+ '
}

fancy_shell_prompt
