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
alias gpom='git push origin master'
alias gpm='git push origin master'

# ruby/rails aliases

alias bi='bundle install'
alias be='bundle exec'
alias b='bundle exec'
alias cuc='bundle exec cucumber --format=pretty'
alias sc='bundle exec rails console'
alias rc='bundle exec rails console'
alias console='bundle exec rails console'
alias dbc='bundle exec rails dbconsole'
alias rs='bundle exec rake spec'

# projects
alias rq='cd ~/p/Mini-Racquet'
alias ccweb='cd ~/p/codeclimate'
alias cc='cd ~/p/codeclimate'
alias ccwork='cd ~/p/quality-worker'
alias work='cd ~/p/quality-worker'
alias smoke='cd ~/p/quality-smoke'

alias docker='docker -H=tcp://127.0.0.1:2200'
