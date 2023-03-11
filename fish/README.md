- [Fish shell](https://fishshell.com/)
- [Fisher](https://github.com/jorgebucaran/fisher) - Plugin manager
- [Tide](https://github.com/IlanCosman/tide) - Shell theme. Use version 5: `fisher install ilancosman/tide@v5`
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts. I use Hack.
- [z for fish](https://github.com/jethrokuan/z) - Directory jumping
- [Exa](https://the.exa.website/) - `ls` replacement
- [ghq](https://github.com/x-motemen/ghq) - Local Git repository organizer
- [peco](https://github.com/peco/peco) - Interactive filtering
- [starship](https://github.com/starship/starship) - The minimal, blazing-fast, and infinitely customizable prompt for any shell!

### fisher
``` fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
curl -sSL https://git.io/fisher_path.fish --create-dirs -o $__fish_config_dir/conf.d/fisher_path.fish
```


### z
``` fish
fisher install jethrokuan/z
```
### starship
``` fish
brew install starship
```
Add the following to the end of ~/.config/fish/config.fish:
``` fish
starship init fish | source
```

### Tide
``` fish
fisher install ilancosman/tide@v5
```
