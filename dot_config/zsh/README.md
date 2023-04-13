### oh-my-zsh
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Custom Direcotry
```zsh
curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
ZSH="$HOME/.config/zsh/ohmyzsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
### zsh compinit: insecure directories, run compaudit for list.
```
compaudit

```
