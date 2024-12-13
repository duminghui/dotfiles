#### .fish scripts in ~/.config/fish/conf.d/ are also automatically executed before config.fish.
### conf.d/*fish -> functions/*.fish -> config.fish
if status is-login
    # echo "is-login"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    # echo "is-interactive"
    # if  not set -q TMUX && not set -q VSCODE_INJECTION
    # 用and必须换行
    if not set -q TMUX
        and not set -q VSCODE_INJECTION
        and test "$LC_TERMINAL" = iTerm2
        tmux new
    end
end


# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block blink
# Set the insert mode cursor to a line
set fish_cursor_insert line blink
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore blink
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual underscore blink

set fish_color_command green
set fish_color_error magenta
set fish_color_autosuggestion brgreen brblack
# set fish_color_autosuggestion 586e75 brblack #brgreen

### starship ###
if type -q starship
    function starship_transient_prompt_func
        starship module sudo
        starship module username
        starship module hostname
        starship module directory
        starship module git_branch
        starship module git_commit
        starship module git_state
        starship module git_metrics
        starship module git_status
        starship module character
    end
    function starship_transient_rprompt_func
        # cmd_duration always ""
        # starship module cmd_duration
        starship module time
    end
    starship init fish | source
    enable_transience
end

# if type -q exa
#     abbr ll "exa -lg -smodified --time-style=long-iso --icons"
#     abbr lla "exa -lg -smodified --time-style=long-iso --icons -a"
if type -q lsd
    # abbr ls "lsd -L"
    abbr ls lsd
    abbr ll "lsd -ltr"
    abbr lla "lsd -Altr"
else
    abbr lla "ls -Altrh"
end

if type -q vivid
    set -gx LS_COLORS (vivid generate $XDG_CONFIG_HOME/vivid/solarized-dark.yml)
end

### alias abbr ###
abbr -a proxy-on export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
# abbr -a proxy-on export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890
abbr -a proxy-off set -e https_proxy http_proxy all_proxy
abbr -a ipinfo curl cip.cc

# ~/.local/share/miniconda3/bin/conda init fish
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f ~/.local/share/miniconda3/bin/conda
    eval ~/.local/share/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "~/.local/share/miniconda3/etc/fish/conf.d/conda.fish"
        . "~/.local/share/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "~/.local/share/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
