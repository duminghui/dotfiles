#!/usr/bin/env bash
#
# bootstrap installs things.

# cd "$(dirname "$0")/.."
# cd "$(dirname "$0")/.."
# DOTFILES_ROOT=$(pwd -P)
if [ ! $DOTFILES_ROOT ];
then
    cd "$(dirname "$0")/.."
    export DOTFILES_ROOT=$(pwd -P)
fi
cd "$DOTFILES_ROOT"
echo "DOTFILES_ROOT:'$DOTFILES_ROOT'"

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

setup_gitconfig () {
  if ! [ -f git/gitconfig.local.dotsymlink ]
  then
    info 'setup gitconfig'

    git_credential='cache'
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential='osxkeychain'
    fi

    user ' - What is your github author name?'
    read -e git_authorname
    user ' - What is your github author email? (xxx@users.noreply.github.com)'
    read -e git_authoremail

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" git/gitconfig.local.template > git/gitconfig.local.dotsymlink

    success 'gitconfig'
  fi
}


link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else
        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotsymlink () {
  info 'installing dot symlink to "$HOME"'

  local overwrite_all=false backup_all=false skip_all=false

  # for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.dotsymlink' -not -path '*.git*')
  for src in $(find -L "$DOTFILES_ROOT" -maxdepth 2 -path '*/*.skip' -prune -o -name '*.dotsymlink' -not -path '*.git*' -print)
  do
    dst="$HOME/.$(basename "${src%.dotsymlink}")"
    link_file "$src" "$dst"
  done
}

install_symlinks(){
    info "installing symlinks in dotfolders"

    local overwrite_all=false backup_all=false skip_all=false

    for src in $(find -L $DOTFILES_ROOT/*.dot -path '*/*.skip' -prune -o -name '*.symlink' -not -path '*.git*' -print)
    do
        dst=`echo $src | sed 's/\/\([0-9a-zA-Z_.]\{1,\}\)\.dot/\/.\1/g'`
        dst="$HOME${dst#$DOTFILES_ROOT}"
        dst="${dst%.symlink}"
        parentfolder="${dst%$(basename $dst)}"
        if [ ! -d $parentfolder ]
        then
            mkdir -p $parentfolder
            success "create parent folder for [$dst] "
        fi
        link_file "$src" "$dst"
    done
}

setup_gitconfig
install_symlinks
install_dotsymlink

echo ''
echo '  All dotfiles linked!'
