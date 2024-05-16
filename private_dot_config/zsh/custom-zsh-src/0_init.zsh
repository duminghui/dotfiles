export LANG=zh_CN.UTF-8
export LC_CTYPE=zh_CN.UTF-8

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

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

### rust ###
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
export CARGO_HTTP_MULTIPLEXING=false
export SCCACHE_DIR=~/.cache/sccache
export SCCACHE_CACHE_SIZE="3G"

if test -f "$CARGO_HOME/env"; then
    . "$CARGO_HOME/env"
fi

### tmuxinator ###
export EDITOR=nvim
export DISABLE_AUTO_TITLE=true
export TMUX_CONF=$XDG_CONFIG_HOME/tmux/tmux.conf


### golang ###
if type brew &>/dev/null; then
    export GOROOT="$(brew --prefix)/opt/go/libexec"
fi
export GOPATH=$XDG_DATA_HOME/go
if test -d "$GOPATH/bin"; then
    export PATH=$GOPATH/bin:$PATH
fi

### gradle ###
if type brew &>/dev/null; then
    export GRADLE_HOME="$(brew --prefix)/opt/gradle"
    # export PATH=$GRADLE_HOME/bin:$PATH
fi

### android ###
export JAVA_HOME=/Library/Java/Home
if test -d "$JAVA_HOME/bin"; then
    export PATH=$JAVA_HOME/bin:$PATH
fi

export ANDROID_HOME=$HOME/Library/Android/sdk
if test -d "$ANDROID_HOME"; then
    export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
    export NDK_HOME=$ANDROID_HOME/ndk-bundle
    export ANDROID_NDK=$NDK_HOME
    export ANDROID_NDK_HOME=$NDK_HOME
    export NDK=$ANDROID_NDK_HOME
    export PATH=$NDK_HOME:$PATH
fi

### flutter ###
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export PUB_CACHE=$HOME/.pub-cache
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH=~/Library/flutter/bin:$PATH

### ruby
if type brew &>/dev/null; then
    export PATH=$(brew --prefix)/opt/ruby/bin:$PATH
fi
export GEM_HOME=$XDG_DATA_HOME/gem
if test -d "$GEM_HOME/bin"; then
    export PATH=$GEM_HOME/bin:$PATH
fi

### nodejs ###
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npmrc
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm

export NVM_DIR=$XDG_DATA_HOME/nvm
export NVM_NODEJS_ORG_MIRROR=https://npmmirror.com/mirrors/node/

### pnpm ###
export PNPM_HOME=$XDG_DATA_HOME/pnpm
if test -d "$PNPM_HOME"; then
    export PATH=$PNPM_HOME:$PATH
fi

