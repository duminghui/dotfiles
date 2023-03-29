#### .fish scripts in ~/.config/fish/conf.d/ are also automatically executed before config.fish.
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

# set fish_color_autosuggestion brgreen
set fish_color_autosuggestion 586e75 brblack #brgreen

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

if type -q exa
    abbr ll "exa -lg -smodified --time-style=long-iso --icons"
    abbr lla "exa -lg -smodified --time-style=long-iso --icons -a"
else
    abbr lla "ls -alrth"
end

### alias abbr ###
abbr -a proxy-on export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
abbr -a proxy-off set -e https_proxy http_proxy all_proxy
abbr -a ipinfo curl cip.cc


# pnpm
set -gx PNPM_HOME "$XDG_DATA_HOME/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
