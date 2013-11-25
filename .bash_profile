#!/bin/bash

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/.rbenv/bin:/usr/local/share/python:$PATH"

source ~/.bash_aliases
source ~/.ruby_gc
source ~/.git-functions

export EDITOR="subl"
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"
export HISTFILESIZE=2500

eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export GOHOME="/usr/local/Cellar/go/1.0.3"
