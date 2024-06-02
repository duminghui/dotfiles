#!/bin/sh
#
# https://github.com/lsd-rs/lsd/blob/master/src/theme/icon.rs
# 󰅱 md-code_not_equal_variant

cp icons.yaml.org icons.yaml

    # -e 's||󰿃|g' \
gsed -i -r \
    -e 's|^ +([a-z_.-]+):.+[\/ ]+(\W{1})$|  \1: \2|g' \
    -e 's|^ +\("([A-Za-z0-9._+-]+)".+[\/ ]+"(\W{1})"$|  \1: \2|g' \
    -e 's|symlink_dir|symlink-dir|g' \
    -e 's|symlink_file|symlink-file|g' \
    -e 's|device_char|device-char|g' \
    -e 's|device_block|device-block|g' \
    -e 's|||g' \
    -e 's||󰝨|g' \
    -e 's||󱕵|g' \
    -e 's||󰆓|g' \
    -e 's||󰀲|g' \
    -e 's||󱁿|g' \
    -e 's||󰆧|g' \
    -e 's||󰌠|g' \
    -e 's||󰒓|g' \
    -e 's||󱘗|g' \
    -e 's||󱘗|g' \
    -e 's||󰍔|g' \
    -e 's||󰌟|g' \
    -e 's|||g' \
    -e 's||󰌜|g' \
    -e 's||󰒓|g' \
    -e 's||󰇄|g' \
    -e 's||󰡨|g' \
    -e 's||󰂺|g' \
    -e 's||󱧨|g' \
    -e 's||󰀵|g' \
    -e 's||󰙪|g' \
    -e 's||󰓎|g' \
    -e 's||󰆼|g' \
    -e 's||󰊢|g' \
    -e 's||󰊤|g' \
    -e 's||󰮠|g' \
    -e 's||󰊢|g' \
    -e 's||󰌾|g' \
    -e 's||󰀲|g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's||󰋜|g' \
    -e 's||󰌠|g' \
    -e 's||󰈟|g' \
    -e 's||󰌞|g' \
    -e 's||󰗀|g' \
    -e 's|󰇰|󰗰|g' \
    -e 's||󰐣|g' \
    -e 's||󰱾|g' \
    -e 's|||g' \
    -e 's||󰋋|g' \
    -e 's||󰒋|g' \
    -e 's||󰛷|g' \
    -e 's||󰎙|g' \
    -e 's||󰛷|g' \
    -e 's||󰛷|g' \
    -e 's|||g' \
    -e 's||󰏜|g' \
    -e 's||󰏜|g' \
    -e 's||󰣇|g' \
    -e 's|󰆍||g' \
    -e 's||󰀄|g' \
    -e 's|󰚩|󱚝|g' \
    -e 's||󰫏|g' \
    -e 's||󰴭|g' \
    -e 's||󰟬|g' \
    -e 's||󱇴|g' \
    -e 's|||g' \
    -e 's||󰩹|g' \
    -e 's||󰛦|g' \
    -e 's||󰇧|g' \
    -e 's||󰕧|g' \
    -e 's||󰨞|g' \
    -e 's||󰗄|g' \
    -e 's|||g' \
    -e 's||󰝚|g' \
    -e 's|||g' \
    -e 's||󰈰|g' \
    -e 's||󰅩|g' \
    -e 's||󰖳|g' \
    -e 's||󰙲|g' \
    -e 's||󰬷|g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's||󰅶|g' \
    -e 's||󰁥|g' \
    -e 's||󰈛|g' \
    -e 's||󰙱|g' \
    -e 's|||g' \
    -e 's||󰀼|g' \
    -e 's|||g' \
    -e 's||󰈬|g' \
    -e 's||󰗚|g' \
    -e 's||󰣨|g' \
    -e 's||󰅴|g' \
    -e 's|||g' \
    -e 's||󰛖|g' \
    -e 's||󰗚|g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's||󰟓|g' \
    -e 's||󰈧|g' \
    -e 's||󱗞|g' \
    -e 's||󰬏|g' \
    -e 's||󰲒|g' \
    -e 's||󰌝|g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's||󰜈|g' \
    -e 's||󱈙|g' \
    -e 's|||g' \
    -e 's||󰕲|g' \
    -e 's||󰘋|g' \
    -e 's||󰢱|g' \
    -e 's||󰍇|g' \
    -e 's||󰣖|g' \
    -e 's||󱄅|g' \
    -e 's||󰈦|g' \
    -e 's||󰀵|g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's||󰌌|g' \
    -e 's||󰑬|g' \
    -e 's||󰈙|g' \
    -e 's|||g' \
    -e 's||󰬚|g' \
    -e 's||󰛥|g' \
    -e 's|||g' \
    -e 's|󰡄|󰹭|g' \
    -e 's||󰈹|g' \
    -e 's|||g' \
    -e 's||󰝰|g' \
    -e 's||󰈔|g' \
    -e 's||󱧮|g' \
    -e 's||󰪹|g' \
    -e 's|||g' \
    -e 's||󰜗|g' \
    -e 's||󰅐|g' \
    -e 's||󰚯|g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's||󱌣|g' \
    icons.yaml

icon_manage() {
  local parent=$1 key=$2 icon=$3
  if [ -z "$parent" -o -z "$key" -o -z "$icon" ]; then
    echo "[Error] '$parent', '$key', '$icon'"
    return
  fi
  local range="/^$parent:\$/,/^\$"
  if [ -n "$(gsed -nr "$range/{/^ +$key: $icon\$/p}" icons.yaml)" ]; then
    return
  elif [ -n "$(gsed -nr "$range/{/ +$key:/p}" icons.yaml)" ]; then
    gsed -i -r "$range/{s|^ +$key: .*\$|  $key: $icon|g}" icons.yaml
    echo "[]$parent: '$key: $icon'"
  else
    gsed -i -r "/^$parent:\$/a \ \ $key: $icon" icons.yaml
    echo "[󰐕]$parent: '$key: $icon'"
  fi
}

name_icon(){
  icon_manage 'name' "$1" "$2"
}

extension_icon(){
  icon_manage 'extension' "$1" "$2"
}

name_icon 'work' '󰃖'
name_icon 'tmuxinator' '󰡃'
name_icon 'tmux' '󰕮'
name_icon 'parallels' '󰜨'
name_icon 'npmrc' '󰛷'
name_icon 'movies' '󰎁'
name_icon 'library' '󰁰'
name_icon 'fish' '󱢺'
name_icon 'copyright' '󰗦'
name_icon '"applications \(parallels\)"' '󰜨'
name_icon 'android' '󰀲'
name_icon '\.zshenv' ''
name_icon 'vite\.config\.ts' '󰉁'
name_icon '\.yarnrc.yml' ''
name_icon '\.ssh' '󰣀'
name_icon '\.pub-cache' ''
name_icon '\.m2' ''
name_icon '\.localized' '󰀵'
name_icon '\.gradle' ''
name_icon '.editorconfig' ''
name_icon '\.docker' '󰡨'
name_icon '\.dartserver' ''
name_icon '\.dart' ''
name_icon '\.condarc' '󰌠'
name_icon '\.conda' '󰌠'

extension_icon 'jsonc' '󰘦'
extension_icon 'jks' '󰿃'
extension_icon 'fish' '󱢺'
extension_icon 'editorconfig' ''

