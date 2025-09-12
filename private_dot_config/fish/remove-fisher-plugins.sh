#!/bin/bash

# 删除fish_variables之后, 装的插件的信息会丢失, 不能重新安装插件, 需要删除以下文件能才重新安装
set -eux

# jethrokuan/z
# rm ~/.config/fish/functions/__z.fish
# rm ~/.config/fish/functions/__z_add.fish
# rm ~/.config/fish/functions/__z_clean.fish
# rm ~/.config/fish/functions/__z_complete.fish
# rm ~/.config/fish/conf.d/z.fish

# fabioantunes/fish-nvm
# rm ~/.config/fish/functions/__nvm_run.fish
# rm ~/.config/fish/functions/node.fish
# rm ~/.config/fish/functions/npm.fish
# rm ~/.config/fish/functions/npx.fish
# rm ~/.config/fish/functions/nvm.fish
# rm ~/.config/fish/functions/nvm_alias_command.fish
# rm ~/.config/fish/functions/nvm_alias_function.fish
# rm ~/.config/fish/functions/yarn.fish
# rm ~/.config/fish/completions/nvm.fish

# edc/bass
# rm ~/.config/fish/functions/__bass.py
# rm ~/.config/fish/functions/bass.fish

# halostatue/fish-docker@v1.x
# rm ~/.config/fish/conf.d/halostatue_fish_docker.fish
# rm ~/.config/fish/completions/docker-compose.fish
# rm ~/.config/fish/completions/docker.fish

# qiuxiang/flutter-fish-completions
# rm ~/.config/fish/completions/flutter.fish
