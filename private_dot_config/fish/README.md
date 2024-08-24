- [Fish shell](https://fishshell.com/)
- [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish) - Plugin manager
- [Nerd fonts](https://github.com/ryanoasis/nerd-fonts) - Powerline-patched fonts.
- [z for fish](https://github.com/jethrokuan/z) - Directory jumping
- [Exa](https://the.exa.website/) - `ls` replacement
- [peco](https://github.com/peco/peco) - Interactive filtering
- [starship](https://github.com/starship/starship) - The minimal, blazing-fast, and infinitely customizable prompt for any shell!

### oh-my-fish

```fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf channel dev
```

Why use channel `dev` not `stable`
https://github.com/oh-my-fish/oh-my-fish/pull/908

### fisher

```fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

```

### z

```fish
omf install https://github.com/jethrokuan/z
fisher install jethrokuan/z
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

### rust

```fish
rustup completions fish > ~/.config/fish/completions/rustup.fish
```

### nvm

```fish
brew install nvm
bash /opt/homebrew/opt/nvm/nvm.sh
fisher install FabioAntunes/fish-nvm edc/bass
```

### pnpm

```fish
fisher install g-plane/pnpm-shell-completion
```

这个插件会创建$HOME/.local/bin目录
