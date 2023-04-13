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
# set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.ustc.edu.cn/homebrew-core.git"

test -x /opt/homebrew/bin/brew; and eval "$(/opt/homebrew/bin/brew shellenv)"

### rust ####
set -gx RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -gx RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup
set -gx CARGO_HTTP_MULTIPLEXING false
set -gx SCCACHE_DIR $XDG_CACHE_HOME/sccache
set -gx SCCACHE_CACHE_SIZE "3G"

set -gx PATH ~/.cargo/bin $PATH

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
    set -gx GOPATH $HOME/go
    set -gx GO111MODULE on
    # export PATH="$GOPATH/bin:$PATH"
    set -gx PATH $GOPATH/bin $PATH
end

### gradle ###
if type -q brew; and test -d (brew --prefix)/opt/gradle
    set -gx GRADLE_HOME (brew --prefix)/opt/gradle
    set -gx PATH $GRADLE_HOME/bin $PATH
end

### android ###
set -gx JAVA_HOME /Library/Java/Home
test -d $JAVA_HOME/bin; and set -gx PATH $JAVA_HOME/bin $PATH

set -gx ANDROID_HOME ~/Library/Android/sdk
test -d $ANDROID_HOME; and set -gx PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $PATH
set -gx NDK_HOME $ANDROID_HOME/ndk-bundle
set -gx ANDROID_NDK $NDK_HOME
set -gx ANDROID_NDK_HOME $NDK_HOME
set -gx NDK $ANDROID_NDK_HOME
test -d $NDK_HOME; and set -gx PATH $NDK_HOME $PATH

### flutter ###
set -gx PUB_HOSTED_URL https://pub.flutter-io.cn
set -gx PUB_CACHE ~$XDG_CACHE_HOME/pub-cache
set -gx FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
test -d ~/Library/flutter/bin; and set -gx PATH ~/Library/flutter/bin $PATH

### nodejs ###
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npmrc
set -gx NPM_CONFIG_CACHE $XDG_CACHE_HOME/npm

set -gx NVM_DIR $XDG_DATA_HOME/nvm
set -gx NVM_NODEJS_ORG_MIRROR https://npmmirror.com/mirrors/node/

