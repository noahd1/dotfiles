#!/bin/bash

# alias gems_tunnel='ssh -NCf -L 2000:localhost:80 gems.efficiency20.com'

alias ps?='ps aux | grep '

# alias mate='subl'

# git aliases
alias gs='git status'
alias gst='git status'
alias gd="subl-pipe git-diff 'git diff'"
alias gpr='git pull --rebase'
alias gitl='git log --pretty=format:"%h %ar %Cblue %an %Cred %s"'
alias gb='git branch'
alias gba='git branch -a -v'
alias gcm='git co master'
alias gca='git commit -av'
alias gls='git --no-pager log --date=short --all --pretty=format:"%C(yellow)%h %Creset%cd%Cred|%cn|%Creset%s%C(bold yellow)|%d%Creset" | awk -F "|" "{gsub(/[a-z]+/,\"\",\$2);gsub(/ /,\"\",\$2);gsub(/&/,\" & \",\$2);gsub(/uction\/|ing\/|_testing\/|gin\//,\":\",\$4);gsub(/[0-9]{6}\,/,\",\",\$4);gsub(/[0-9]{6}\)/,\")\",\$4);print\$0}" | less -ReS'

# ruby/rails aliases

alias bi='bundle install'
alias be='bundle exec'
alias cuc='bundle exec cucumber --format=pretty'
alias console='bundle exec rails console'
alias dbconsole='bundle exec rails dbconsole'
alias rs='bundle exec rake spec'

# bin aliases
alias desc='mysql_desc'
alias indexes='mysql_indexes'

# projects
alias racquet='cd ~/Projects/Mini-Racquet'
