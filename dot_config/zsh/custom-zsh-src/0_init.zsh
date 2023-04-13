export LANG=zh_CN.UTF-8
export LC_CTYPE=zh_CN.UTF-8

export HOMEBREW_NO_AUTO_UPDATE=true
export HOMEBREW_NO_INSTALL_CLEANUP=true
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"

## for old maxos version
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
# brew tap --custom-remote --force-auto-update homebrew/cask https://mirrors.ustc.edu.cn/homebrew-cask.git

if type /opt/homebrew/bin/brew &>/dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif type brew &>/dev/null; then
    eval "$(brew shellenv)"
fi

export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
export CARGO_HTTP_MULTIPLEXING=false

if test -f "$HOME/.cargo/env"; then
    . "$HOME/.cargo/env"
fi

