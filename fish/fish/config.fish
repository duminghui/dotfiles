if status is-login
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual underscore

### system ###
set -gx LANG zh_CN.UTF-8
set -gx LC_CTYPE zh_CN.UTF-8

# https://the.exa.website/docs/colour-themes
# set -gx LS_COLORS 'di=34:ln=35:so=32:pi=33:ex=31:bd=34:cd=34:su=0:sg=0:tw=0:ow=0:'

### homeberw ###
set -gx HOMEBREW_NO_AUTO_UPDATE true
set -gx HOMEBREW_NO_INSTALL_CLEANUP true
set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.ustc.edu.cn/brew.git"
set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.ustc.edu.cn/homebrew-core.git"
set -gx HOMEBREW_BOTTLE_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles"
set -gx HOMEBREW_API_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles/api"

test -x /opt/homebrew/bin/brew; and eval "$(/opt/homebrew/bin/brew shellenv)"

### rust ####
set -gx RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -gx RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup
set -gx CARGO_HTTP_MULTIPLEXING false
set -gx SCCACHE_DIR ~/.cache/sccache
set -gx SCCACHE_CACHE_SIZE "3G"

set -gx PATH ~/.cargo/bin $PATH

### starship ###
if type -q starship
    function starship_transient_prompt_func
        starship module directory
        starship module character
    end
    function starship_transient_rprompt_func
        starship module time
    end
    starship init fish | source
    enable_transience
end

### alias abbr ###
abbr -a proxy-on export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
abbr -a proxy-off set -e https_proxy http_proxy all_proxy
abbr -a ipinfo curl cip.cc

if type -q exa
    alias ll "exa -lg -smodified --time-style=long-iso --icons"
    abbr lla "ll -a"
end


### tmuxinator ###
type -q nvim; and set -gx EDITOR nvim
# why add this in https://github.com/tmuxinator/tmuxinator
set -gx DISABLE_AUTO_TITLE true
set -gx TMUX_CONF ~/.config/tmux/tmux.conf
# set -gx TERM xterm-256color
if type -q tmuxinator
    abbr mux tmuxinator
end

### golang ###
if type -q brew; and test -d (brew --prefix)/opt/go/libexecx
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
set -gx PUB_CACHE ~/.pub-cache
set -gx FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
test -d ~/Library/flutter/bin; and set -gx PATH ~/Library/flutter/bin $PATH

### nodejs ###
set -gx  NVM_NODEJS_ORG_MIRROR https://npmmirror.com/mirrors/node/

# test -e ~/.docker/init-fish.sh; and source ~/.docker/init-fish.sh

