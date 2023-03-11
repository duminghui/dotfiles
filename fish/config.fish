if status is-login
end
if status is-interactive
    # Commands to run in interactive sessions can go here
end
### system ###
set -gx LANG zh_CN.UTF-8
set -gx LC_CTYPE zh_CN.UTF-8

# https://the.exa.website/docs/colour-themes
set -gx LS_COLORS 'di=34:ln=35:so=32:pi=33:ex=31:bd=34:cd=34:su=0:sg=0:tw=0:ow=0:'


### homeberw ###
set -gx HOMEBREW_NO_AUTO_UPDATE true
set -gx HOMEBREW_BREW_GIT_REMOTE "https://mirrors.ustc.edu.cn/brew.git"
set -gx HOMEBREW_CORE_GIT_REMOTE "https://mirrors.ustc.edu.cn/homebrew-core.git"
set -gx HOMEBREW_BOTTLE_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles"
set -gx HOMEBREW_API_DOMAIN "https://mirrors.ustc.edu.cn/homebrew-bottles/api"

test -e /opt/homebrew/bin/brew; and eval "$(/opt/homebrew/bin/brew shellenv)"

### fisher ###
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
# curl -sSL https://git.io/fisher_path.fish --create-dirs -o $__fish_config_dir/conf.d/fisher_path.fish
# set -U fisher_path ~/.config/fish/fisher

### starship ###
type -q starship; and starship init fish | source

### alias abbr ###
abbr -a proxy-on export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
abbr -a proxy-off set -e https_proxy http_proxy all_proxy
abbr -a ipinfo curl cip.cc

if type -q exa
    abbr ll "exa -lg -smodified --icons"
    abbr lla "exa -lga -smodified --icons"
end

### tmux ###
set -gx EDITOR nvim
set -gx DISABLE_AUTO_TITLE true


### rust ####
set -gx RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static
set -gx RUSTUP_UPDATE_ROOT https://mirrors.ustc.edu.cn/rust-static/rustup
set -gx CARGO_HTTP_MULTIPLEXING false
set -gx SCCACHE_DIR ~/.cache/sccache
set -gx SCCACHE_CACHE_SIZE "3G"

set -gx PATH ~/.cargo/bin $PATH

### golang ###
if type -q brew
    set -gx GOROOT (brew --prefix)/opt/go/libexec
    set -gx GOPATH $HOME/go
    set -gx GO111MODULE on
    # export PATH="$GOPATH/bin:$PATH"
    set -gx PATH $GOPATH/bin $PATH
end

### gradle ###
set -gx GRADLE_HOME (brew --prefix)/opt/gradle
set -gx PATH $GRADLE_HOME/bin $PATH

### android ###
set -gx JAVA_HOME /Library/Java/Home
set -gx PATH $JAVA_HOME/bin $PATH

set -gx ANDROID_HOME ~/Library/Android/sdk
set -gx PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $PATH
set -gx NDK_HOME $ANDROID_HOME/ndk-bundle
set -gx ANDROID_NDK $NDK_HOME
set -gx ANDROID_NDK_HOME $NDK_HOME
set -gx NDK $ANDROID_NDK_HOME
set -gx PATH $NDK_HOME $PATH

### flutter ###
set -gx PUB_HOSTED_URL https://pub.flutter-io.cn
set -gx PUB_CACHE ~/.pub-cache
set -gx FLUTTER_STORAGE_BASE_URL https://storage.flutter-io.cn
set -gx PATH ~/Library/flutter/bin $PATH

### nodejs ###
set -gx  NVM_NODEJS_ORG_MIRROR https://npmmirror.com/mirrors/node/

source /Users/dumh/.docker/init-fish.sh || true # Added by Docker Desktop

