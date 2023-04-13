#!/bin/sh
#
# https://github.com/lsd-rs/lsd/blob/master/src/theme/icon.rs
# 󰅱 md-code_not_equal_variant

cp icons.yaml.org icons.yaml

gsed -i -r \
    -e 's|^ +([a-z_.-]+):.+[\/ ]+(\W{1})$|  \1: \2|g' \
    -e 's|^ +\("([A-Za-z0-9._+-]+)".+[\/ ]+"(\W{1})"$|  \1: \2|g' \
    -e 's|symlink_dir|symlink-dir|g' \
    -e 's|symlink_file|symlink-file|g' \
    -e 's|device_char|device-char|g' \
    -e 's|device_block|device-block|g' \
    -e 's|||g' \
    -e 's|歷|󰒍|g' \
    -e 's||󰝨|g' \
    -e 's||󰿃|g' \
    -e 's||󰁯|g' \
    -e 's||󱁿|g' \
    -e 's||󰌠|g' \
    -e 's||󰒓|g' \
    -e 's||󱘗|g' \
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
    -e 's||󰀂|g' \
    -e 's||󰌠|g' \
    -e 's||󰈟|g' \
    -e 's||󰌞|g' \
    -e 's||󰗀|g' \
    -e 's||󰗰|g' \
    -e 's||󰐣|g' \
    -e 's|פּ|󰙅|g' \
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
    -e 's||󰣇|g' \
    -e 's|||g' \
    -e 's||󰀄|g' \
    -e 's||󰌠|g' \
    -e 's|ﮧ|󱚝|g' \
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
    -e 's|ﰩ|󰜫|g' \
    -e 's||󰗄|g' \
    -e 's|||g' \
    -e 's||󰮥|g' \
    -e 's|||g' \
    -e 's||󰈰|g' \
    -e 's||󰅩|g' \
    -e 's||󰖳|g' \
    -e 's|蘿|󰐑|g' \
    -e 's||󰙲|g' \
    -e 's||󰬷|g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's||󰅲|g' \
    -e 's||󰅶|g' \
    -e 's||󰁥|g' \
    -e 's||󰌛|g' \
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
    -e 's||󰌆|g' \
    -e 's||󰀵|g' \
    -e 's|||g' \
    -e 's|||g' \
    -e 's|ﳒ|󰟔|g' \
    -e 's|||g' \
    -e 's||󰌌|g' \
    -e 's|鉶|󰗆|g' \
    -e 's||󰑬|g' \
    -e 's||󰈙|g' \
    -e 's|||g' \
    -e 's||󰬚|g' \
    -e 's||󰛥|g' \
    -e 's|||g' \
    -e 's|﵂|󰹭|g' \
    -e 's||󰈹|g' \
    -e 's||󰝰|g' \
    -e 's||󰈔|g' \
    -e 's||󰈲|g' \
    -e 's||󰆨|g' \
    -e 's||󱧮|g' \
    -e 's||󰪹|g' \
    -e 's|||g' \
    -e 's||󰜗|g' \
    icons.yaml

icon_manage() {
  local rStart=$1 rEnd=$2 key=$3 icon=$4
  if [ -z "$rStart" -o -z "$rEnd" -o -z "$key" -o -z "$icon" ]; then
    echo "[Error] '$rStart', '$rEnd', '$key', '$icon'"
    return
  fi
  local range="/^$rStart:\$/,/^$rEnd:\$"
  if [ -n "$(gsed -nr "$range/{/^ +$key: $icon\$/p}" icons.yaml)" ]; then
    return
  elif [ -n "$(gsed -nr "$range/{/ +$key:/p}" icons.yaml)" ]; then
    gsed -i -r "$range/{s|^ +$key: .*\$|  $key: $icon|g}" icons.yaml
    echo "[]$rStart: '$key: $icon'"
  else
    gsed -i -r "/^$rStart:\$/a \ \ $key: $icon" icons.yaml
    echo "[󰐕]$rStart: '$key: $icon'"
  fi
}

name_icon(){
  icon_manage 'name' 'extension' "$1" "$2"
}

extension_icon(){
  icon_manage 'extension' 'filetype' "$1" "$2"
}

name_icon 'work' '󰃖'
name_icon 'tmux' '󰡃'
name_icon 'parallels' '󰜨'
name_icon 'npmrc' '󰛷'
name_icon 'movies' '󰎁'
name_icon 'library' '󰁰'
name_icon 'gradle' ''
name_icon 'fish' '󱢺'
name_icon 'config' '󰒓'
name_icon '"applications \(parallels\)"' '󰜨'
name_icon 'android' '󰀲'
name_icon '\.zshenv' ''
name_icon '\.yarnrc.yml' ''
name_icon '\.m2' ''
name_icon '\.localized' '󰀵'
name_icon '\.gradle' ''
name_icon '\.docker' '󰡨'
name_icon '\.condarc' '󰌠'
name_icon '\.cache' '󰃨'
name_icon '\.android' '󰀲'

extension_icon 'org' ''
extension_icon 'jsonc' '󰘦'
extension_icon 'jpg' '󰈥'
extension_icon 'jpeg' '󰈥'
extension_icon 'jks' '󰿃'
extension_icon 'gradle' ''
extension_icon 'fish' '󱢺'

