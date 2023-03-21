- [Fish shell](https://fishshell.com/)
- [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) - Plugin manager
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts. I use Hack.
- [z for fish](https://github.com/jethrokuan/z) - Directory jumping
- [Exa](https://the.exa.website/) - `ls` replacement
- [peco](https://github.com/peco/peco) - Interactive filtering
- [starship](https://github.com/starship/starship) - The minimal, blazing-fast, and infinitely customizable prompt for any shell!

### oh-my-fish
``` fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

### z
``` fish
omf install https://github.com/jethrokuan/z
```
### starship
``` fish
brew install starship
```
Add the following to the end of ~/.config/fish/config.fish:
``` fish
starship init fish | source
```
### exa
``` fish
brew install exa

```

### nvm
``` fish
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

