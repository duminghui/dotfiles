#!/usr/bin/env bash
set -x
set -euo pipefail

if type /Applications/Docker.app/Contents/MacOS/uninstall >/dev/null 2>&1; then
    /Applications/Docker.app/Contents/MacOS/uninstall
fi

rm -rf ~/Library/Group\ Containers/group.com.docker
rm -rf ~/Library/Containers/com.docker.docker
rm -rf ~/.docker
