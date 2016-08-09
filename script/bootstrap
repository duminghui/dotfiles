#!/usr/bin/env bash
#
# bootstrap installs things.

if [ ! $DOTFILES_ROOT ];
then
    cd "$(dirname "$0")/.."
    export DOTFILES_ROOT=$(pwd -P)
fi
cd "$DOTFILES_ROOT"
# cd "$(dirname "$0")/.."
# DOTFILES_ROOT=$(pwd -P)

set -e

echo ''

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

# setup_gitconfig
# install_dotfiles
source script/link_dotfiles

# If we're on a Mac, let's install and setup homebrew.
if [ "$(uname -s)" == "Darwin" ]
then
  info "installing dependencies"
  # if source bin/dot > /tmp/dotfiles-dot 2>&1
  if source bin/dot 2>&1
  then
    success "dependencies installed"
  else
    fail "error installing dependencies"
  fi
fi

echo ''
echo '  All installed!'
