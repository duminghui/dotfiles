#!/bin/sh
#
# 󰅱 md-code_not_equal_variant

sed -i "" -r \
    -e 's|^ {1,}\("(.*)",.*\)[, //]+"(.)"$|  \1: \2|g' \
    -e 's||󰆍|g' \
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
    -e 's|||g' \
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
    -e 's||󰆍|g' \
    -e 's||󰀄|g' \
    -e 's||󰌠|g' \
    -e 's|ﮧ|󱚝|g' \
    -e 's||󰫏|g' \
    -e 's||󰴭|g' \
    -e 's||󰟬|g' \
    -e 's||󱞬|g' \
    -e 's|||g' \
    -e 's||󰩹|g' \
    -e 's||󰛦|g' \
    -e 's||󰇧|g' \
    -e 's||󰕧|g' \
    -e 's||󰘐|g' \
    -e 's|ﰩ|󰜫|g' \
    -e 's||󰗄|g' \
    -e 's|||g' \
    -e 's||󰮥|g' \
    -e 's|||g' \
    -e 's||󰈰|g' \
    -e 's||󰘦|g' \
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
    -e 's|﵂|󰡄|g' \
    -e 's||󰈹|g' \
    -e 's|gradle: 󰀲|gradle: |g' \
    -e 's|||g' \
    icons.yaml

  #   -e '/^name:$/a \
  # movies: 󰎁
  #   ' \

add_icon_to_name() {
  local key=$1 icon=$2
  if [ -z "$(sed -nr "/ +$key: $icon/p" icons.yaml)" ]; then
    sed -i "" -r "/^name:\$/a \\
  $key: $icon
    " icons.yaml
    echo "add icon config to name '  $key: $icon '"
  fi
}

add_icon_to_name "movies" "󰎁"
add_icon_to_name "\\.localized" "󰀵"
add_icon_to_name "android" "󰀲"
add_icon_to_name "\\.android" "󰀲"
add_icon_to_name "\\.gradle" ""



# 添加新行命令添加到指令最后

