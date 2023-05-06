- [Fish shell](https://fishshell.com/)
- [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) - Plugin manager
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts. I use Hack.
- [z for fish](https://github.com/jethrokuan/z) - Directory jumping
- [Exa](https://the.exa.website/) - `ls` replacement
- [peco](https://github.com/peco/peco) - Interactive filtering
- [starship](https://github.com/starship/starship) - The minimal, blazing-fast, and infinitely customizable prompt for any shell!

### oh-my-fish

```fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf channel dev
```

### z

```fish
omf install https://github.com/jethrokuan/z
```

### starship

```fish
brew install starship
cargo install starship
```

Add the following to the end of ~/.config/fish/config.fish:

```fish
starship init fish | source
```

### lsd

```fish
brew install lsd
cargo install --git https://github.com/Peltoche/lsd.git --branch master

```

### vivid (LS_COLORS)

```fish
brew install vivid
cargo install vivid

```

### exa

```fish
brew install exa
cargo install exa

```

### ripgrep

```fish
brew install ripgrep
cargo install ripgrep

```

### fd

```fish
brew install fd
cargo install fd-find

```
