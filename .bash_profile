#!/bin/bash

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.rbenv/bin:$PATH"

source ~/.bash_aliases
source ~/.bash_functions
source /usr/local/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=1

export EDITOR="subl"
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"

eval "$(rbenv init -)"
