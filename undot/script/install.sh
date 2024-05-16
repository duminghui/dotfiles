#!/usr/bin/env bash
#
# Run all dotfiles installers.

set -e

if [ ! $DOTFILES_ROOT ];
then
    cd "$(dirname "$0")/.."
    export DOTFILES_ROOT=$(pwd -P)
fi
cd "$DOTFILES_ROOT"
# cd "$(dirname $0)"/..

# Run Homebrew through the Brewfile
echo "› brew bundle -v --global"
brew bundle -v --global

# find the installers and run them iteratively
find . -name install.sh | while read installer ; do sh -c "${installer}" ; done
