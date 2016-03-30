# Path to your oh-my-zsh installation.
export ZSH=/Users/kevinshu/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git osx ruby rails brew bundler chruby rails vi-mode last-working-dir web-search wd)

bindkey '^R' history-incremental-search-backward

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export AWS_API_IMPORT_TOOL_PATH=/Users/kevinshu/Downloads/aws-apigateway-importer-aws-apigateway-importer-1.0.1/aws-api-import.sh
export AWS_API_ENDPOINT=https://11zxkflij9.evalute-api.us-east-1.amazonaws.com/dev/v1

source $ZSH/oh-my-zsh.sh

alias lk='custom_ls'
alias gs='clear && echo && git status -sb && echo'
alias gaa='git add -A && gs'
alias gap='git add --patch'
alias gc='git commit'
alias gp='git push'
alias gh="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias grv='git remote -v'
alias gr='git remote'
alias grup='git remote update --prune'
alias gpom='git push origin master'
alias gpo='git push origin'
alias gb='git branch'
alias gbd='git branch -D'
alias timetravel='GIT_COMMITTER_DATE="`date`" git commit --amend --date "`date`"'

alias gres='git_reset_soft'
alias greh='git_reset_hard'

alias gkb='git_checkout_and_branch'
alias gcm='git_commit_with_message'
alias gk='git_checkout'
alias grbi='git_rebase_interactive'
alias grb='git_rebase'
alias gl='git_pull'
alias gst='git_stash'

# Browsing functions
function custom_ls () {
  clear

  if [ $# -eq 0 ]; then
    tree --dirsfirst -ChFLa 1
  else
    tree --dirsfirst -ChFLa $1
  fi
}

# Git functions
function git_checkout_and_branch () {
  git checkout -b $1
  update_ctags
}
function git_checkout () {
  git checkout $1
  update_ctags
}
function git_rebase () {
  git rebase $1
  update_ctags
}
function git_rebase_interactive () {
  git rebase -i $1
  update_ctags
}
function git_pull () {
  git pull $1
  update_ctags
}
function git_stash () {
  git stash $1
  update_ctags
}
function git_commit_with_message () {
 if [ $# -eq 0 ]; then
   echo -n "[enter a commit message] "
   read message
   if [ ${#message} -eq 0 ]; then
     git commit -m "No commit message provided."
   else
     git commit -m $message
   fi
 else
   git commit -m "$1"
 fi

 update_ctags
}
function git_reset_soft () {
  if [ $# -eq 0 ]; then
    git reset --soft HEAD
  else
    git reset --soft HEAD~$1
  fi

  # update_ctags
}
function git_reset_hard () {
  if [ $# -eq 0 ]; then
    git reset --hard HEAD
  else
    git reset --hard HEAD~$1
  fi

  update_ctags
}

# Ctags functions
function p_update_ctags () { ctags --recurse --exclude=javascripts --exclude=assets }
function update_ctags () {
  set +m    # disables the shell from reporting on the background jobs
  p_update_ctags &
  pid=$!

  local spinstr='|/-\'
  while kill -0 $pid 2> /dev/null; do   # kill -0 checks if the process is running
    local temp=${spinstr#?}             # 2> /dev/null suppresses errors from when the process ends
    printf "Updating Ctags... [%c]\r" "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep 0.07
  done

  set -m    # reenables the shell for reporting on the background jobs
  printf "Updating Ctags... [%c]\r" "*"
  echo "\nDone!\n"
}
