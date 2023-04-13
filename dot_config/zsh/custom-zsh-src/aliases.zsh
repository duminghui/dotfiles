alias 2_alcatraz_store='cd ~/Library/Application\ Support/Alcatraz/Plug-ins'
alias 2_xcodeplugins_store='cd ~/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins'

if type lsd &>/dev/null; then
    alias ls='lsd -L'
    alias ll="lsd -ltr"
    alias lla="lsd -Altr"
else
    alias ls='ls -G'
    alias ll="ls -lhTrt"
    alias lla="ls -AlhTrt"
fi

alias bbinstall='brew bundle --global -v'
alias bbdump='brew bundle --global -v -f dump'
alias bbclean='brew bundle --global -v cleanup'
alias bblist='brew bundle --global -v list'
alias pip3_o='pip3 list -o --format=columns'
alias pip3_u='pip3 install --upgrade'
alias proxy-on='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
alias proxy-off='unset http_proxy;unset https_proxy;unset all_proxy'
alias ipinfo="curl cip.cc"
