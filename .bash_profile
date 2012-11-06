#!/bin/bash

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.rbenv/bin:$PATH"

source ~/.bash_aliases
source ~/.bash_functions
source ~/.ruby_gc
source ~/.git-functions

export EDITOR="subl"
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"

eval "$(rbenv init -)"
