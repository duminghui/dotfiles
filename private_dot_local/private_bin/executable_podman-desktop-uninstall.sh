#!/usr/bin/env bash
set -x
set -euo pipefail

# podman
if type podman >/dev/null 2>&1; then
  # podman machine list
  # podman machine stop podman-machine-default
  # podman machine rm -f podman-machine-default

  # podman machine list | awk '!/^NAME +VM TYPE/ { gsub(/\*/, "", $1); print $1 }' | xargs -t -I {} sh -c 'podman machine stop {}; podman machine rm -f {};'
  podman machine list | awk 'NR>1 { gsub(/\*/, "", $1); print $1 }' | xargs -t -I {} sh -c 'podman machine stop {}'
fi

if type podman-mac-helper >/dev/null 2>&1; then
  # the podman helper agent, which manages the /var/run/docker.sock link
  # 删除/usr/local/podman/helper/{user}/podman-mac-helper
  sudo podman-mac-helper uninstall
fi

if [[ -e /opt/podman/bin/podman ]]; then
  sudo rm -fv /etc/paths.d/podman-pkg
  sudo rm -rfv /opt/podman
  sudo rm -rfv /usr/local/podman
fi

# if [[ -e $(brew --prefix)/bin/podman ]]; then
# brew uninstall podman
# fi

rm -fv ~/.ssh/*podman*
rm -rf ~/.config/containers
rm -rf ~/.local/share/containers/cache
# 创建VM用的Podman Machine image下载到~/.local/share/containers/podman/machine/applehv/cache目录
# 不删除这个目录下的文件
PODAMN_MACHINE_DIR=~/.local/share/containers/podman/machine
lsd -1 -I applehv $PODAMN_MACHINE_DIR | xargs -I {} rm -rfv $PODAMN_MACHINE_DIR/{}
lsd -1 -I cache $PODAMN_MACHINE_DIR/applehv | xargs -I {} rm -rfv $PODAMN_MACHINE_DIR/applehv/{}
# 重新配置podman desktop 删除目录~/.local/share/containers/podman-desktop
rm -rf ~/.local/share/containers/podman-desktop
rm -rfv ~/.redhat

# podman-desktop
rm -rf ~/Library/Application\ Support/Podman\ Desktop
rm -rf ~/Library/Application\ Support/Caches/podman-desktop-updater
rm -rf ~/Library/Saved\ Application\ State/io.podmandesktop.PodmanDesktop.savedState
rm -fv ~/Library/Preferences/io.podmandesktop.PodmanDesktop.plist
rm -fv ~/Library/Preferences/ByHost/io.podmandesktop.PodmanDesktop.ShipIt*
rm -fv ~/Library/LaunchAgents/io.podman_desktop.PodmanDesktop.plist
rm -rf ~/Library/Logs/Podman\ Desktop
