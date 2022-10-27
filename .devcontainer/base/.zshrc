#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export LANG=ja_JP.UTF-8
export PATH="/usr/bin:$PATH"
alias ll='ls -al'
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

PROTECT_BRANCHES='main|master|develop'

git-delete-merged-branch() {
    git fetch --prune
    git branch --merged | egrep -v "\*|${PROTECT_BRANCHES}" | xargs git branch -d
}
