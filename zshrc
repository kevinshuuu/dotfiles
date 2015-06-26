# Path to your oh-my-zsh installation.
export ZSH=/Users/kshu/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git)


export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
[ -d "/Users/kshu/8b/bin" ] && export PATH="/Users/kshu/8b/bin:$PATH"

alias headway='cd ~/8b/brands/headway/headway/'
alias portfolio='cd ~/8b/apps/portfolio'
alias identity='cd ~/8b/apps/identity'
alias be='bundle exec'
alias powsr='powify server stop && powify server start'
alias powr='powify restart'
alias ls='tree --dirsfirst -ChFL 1'
alias gs='clear && echo && git status -sb && echo'
alias gaa='git add -A && gs'
alias gc='git commit'
alias gcm='git commit -m'
alias gk='git checkout'
alias gkb='git checkout -b'
alias gl='git pull'
alias gp='git push'
alias gh='git hist'
alias gr='git remote -v'
alias grp='git remote update --prune'
alias gpom='git push origin master'
alias gb='git branch'
alias gbd='git branch -D'
