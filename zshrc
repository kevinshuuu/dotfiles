# Path to your oh-my-zsh installation.
export ZSH=/Users/kevinshu/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git osx rake ruby bundler chruby rails vi-mode)


export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

alias powsr='powify server stop && powify server start'
alias powr='powify restart'
alias ls='tree --dirsfirst -ChFL 1'
alias ls2='tree --dirsfirst -ChFL 2'
alias ls3='tree --dirsfirst -ChFL 3'
alias gs='clear && echo && git status -sb && echo'
alias gaa='git add -A && gs'
alias gc='git commit'
alias gcm='git commit -m'
alias gk='git checkout'
alias gkb='git checkout -b'
alias gl='git pull'
alias gp='git push'
alias gh="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias grv='git remote -v'
alias grup='git remote update --prune'
alias gpom='git push origin master'
alias gb='git branch'
alias gbd='git branch -D'
alias timetravel='GIT_COMMITTER_DATE="`date`" git commit --amend --date "`date`"'
alias gri='git rebase -i'
alias gst='git stash'
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

bindkey '^R' history-incremental-search-backward
