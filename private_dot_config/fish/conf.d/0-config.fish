### system ###
set -gx LANG zh_CN.UTF-8
set -gx LC_CTYPE zh_CN.UTF-8
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache

# https://the.exa.website/docs/colour-themes
# set -gx LS_COLORS 'di=34:ln=35:so=32:pi=33:ex=31:bd=34:cd=34:su=0:sg=0:tw=0:ow=0:'

### homeberw ###
set -gx HOMEBREW_NO_AUTO_UPDATE true
set -gx HOMEBREW_NO_INSTALL_CLEANUP true
set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.ustc.edu.cn/brew.git"
set -gx HOMEBREW_BOTTLE_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles"
set -gx HOMEBREW_API_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles/api"
# brew tap --custom-remote --force-auto-update homebrew/services https://mirrors.ustc.edu.cn/homebrew-services.git
## befor Brew 4.0 start
set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.ustc.edu.cn/homebrew-core.git"
# brew tap --custom-remote --force-auto-update homebrew/cask-versions https://mirrors.ustc.edu.cn/homebrew-cask-versions.git
# brew tap --custom-remote --force-auto-update homebrew/cask https://mirrors.ustc.edu.cn/homebrew-cask.git
## befor Brew 4.0 end

if test -x /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
else if test -x brew
    eval "$(brew shellenv)"
end

### rust ####
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
# set -gx PATH $CARGO_HOME/bin $PATH
if type -q fd
    abbr cargo-batch-clean "fd -g 'Cargo.toml' | xargs -t -I {} cargo clean --manifest-path {}"
else
    abbr cargo-batch-clean "find . -name 'Cargo.toml' | xargs -t -I {} cargo clean --manifest-path {}"
end
# set -gx CARGO_HOME $HOME/.cargo
set -gx RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -gx RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup
set -gx CARGO_HTTP_MULTIPLEXING false
# 配置文件不支持相对路径, 暂时不用
# set -gx SCCACHE_CONF $XDG_CONFIG_HOME/sccache/sccache-config.toml
# 下面三个环境变量如果设置了, 不会使用config文件中的cache.disk.dir
set -gx SCCACHE_DIR $XDG_CACHE_HOME/sccache
set -gx SCCACHE_CACHE_SIZE "6G"
set -gx SCCACHE_DIRECT true
# cross
# set -gx CROSS_CONTAINER_ENGINE podman
# taplo
set -gx TAPLO_CONFIG $XDG_CONFIG_HOME/taplo.toml


### tmuxinator ###
type -q nvim; and set -gx EDITOR nvim
# why add this in https://github.com/tmuxinator/tmuxinator
set -gx DISABLE_AUTO_TITLE true
set -gx TMUX_CONF $XDG_CONFIG_HOME/tmux/tmux.conf
# set -gx TERM xterm-256color
if type -q tmuxinator
    abbr mux tmuxinator
end

### golang ###
if type -q brew; and test -d (brew --prefix)/opt/go/libexec
    set -gx GOROOT (brew --prefix)/opt/go/libexec
end
set -gx GOPATH $XDG_DATA_HOME/go
set -gx GOPROXY https://goproxy.cn,direct
test -d $GOPATH/bin; and set -gx PATH $GOPATH/bin $PATH

### gradle ###
if type -q brew; and test -d (brew --prefix)/opt/gradle
    set -gx GRADLE_HOME (brew --prefix)/opt/gradle
    # set -gx PATH $GRADLE_HOME/bin $PATH
end

### android ###
set -gx JAVA_HOME /Library/Java/Home
test -d $JAVA_HOME/bin; and set -gx PATH $JAVA_HOME/bin $PATH

set -gx ANDROID_HOME $HOME/Library/Android/sdk
if test -d $ANDROID_HOME
    set -gx PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $PATH
    set -gx NDK_HOME $ANDROID_HOME/ndk-bundle
    set -gx ANDROID_NDK $NDK_HOME
    set -gx ANDROID_NDK_HOME $NDK_HOME
    set -gx NDK $ANDROID_NDK_HOME
    test -d $NDK_HOME; and set -gx PATH $NDK_HOME $PATH
end

### flutter ###
set -gx PUB_HOSTED_URL https://pub.flutter-io.cn
set -gx PUB_CACHE $HOME/.pub-cache
set -gx FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
test -d $HOME/Library/flutter/bin; and set -gx PATH $HOME/Library/flutter/bin $PATH

### ruby
if type -q brew; and test -d (brew --prefix)/opt/ruby/bin
    set -gx PATH (brew --prefix)/opt/ruby/bin $PATH
end
set -gx GEM_HOME $XDG_DATA_HOME/gem
test -d $GEM_HOME/bin; and set -gx PATH $GEM_HOME/bin $PATH

### nodejs ###
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npmrc
set -gx NPM_CONFIG_CACHE $XDG_CACHE_HOME/npm

set -gx NVM_DIR $XDG_DATA_HOME/nvm
set -gx NVM_NODEJS_ORG_MIRROR https://npmmirror.com/mirrors/node

### pnpm
set -gx PNPM_HOME "$XDG_DATA_HOME/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
test -d $HOME/.local/bin; and set -gx PATH $HOME/.local/bin $PATH

### docker
test -d $HOME/.docker/bin; and set -gx PATH $HOME/.docker/bin $PATH

### solana ###
set -gx SOLANA_HOME $XDG_DATA_HOME/solana/install/active_release
test -d $SOLANA_HOME/bin; and set -gx PATH $SOLANA_HOME/bin $PATH
# for solana-test-validator
test -d (brew --prefix)/opt/gnu-tar/libexec/gnubin; and set -gx PATH $(brew --prefix)/opt/gnu-tar/libexec/gnubin $PATH
### solana ###

