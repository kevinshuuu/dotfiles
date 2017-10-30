# Path to your oh-my-zsh installation.
export ZSH=/Users/kevinshu/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git osx ruby rails bundler chruby rails vi-mode last-working-dir web-search wd)

source $ZSH/oh-my-zsh.sh

alias brake='bundle exec rake'
alias brails='bundle exec rails'
alias lk='custom_ls'
alias ut='update_ctags'

alias gs='clear && echo && git status -sb && echo'
alias gaa='git add -A && gs'
alias gap='git add --patch'
alias gc='git commit'
alias gca='gc --amend'
alias gh="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
alias gr='git remote'
alias grv='gr -v'
alias grup='gr update --prune'
alias gp='git push'
alias gpo='gp origin'
alias gpom='gpo master'
alias gpoc='gpo $(gbc)'
alias gb='git branch'
alias gbd='gb -D'
alias gbc='git rev-parse --abbrev-ref HEAD'
alias gk='git checkout'
alias gkb='gk -b'
alias gkp='gk @{-1}'
alias grb='git rebase'
alias timetravel='GIT_COMMITTER_DATE="`date`" git commit --amend --date "`date`"'

alias gres='git_reset_soft'
alias greh='git_reset_hard'
alias gcm='git_commit_with_message'
alias grbi='git_rebase_interactive'
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
#function git_checkout_and_branch () {
#  git checkout -b $1
#  update_ctags
#}
#function git_checkout () {
#  git checkout $1
#  update_ctags
#}
function git_rebase () {
  git rebase $1
  #update_ctags
}
function git_rebase_interactive () {
  git rebase -i $1
  #update_ctags
}
function git_pull () {
  git pull $1
  #update_ctags
}
function git_stash () {
  git stash $1
  #update_ctags
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

 #update_ctags
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

  #update_ctags
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

bindkey '^R' history-incremental-search-backward

