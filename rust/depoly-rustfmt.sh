#!/bin/sh

target_dir=~/Library/Application\ Support/rustfmt

mkdir -pv "$target_dir"
# cp -v rustfmt.toml "$target_dir/rustfmt.toml"
ln -vfs "$(pwd)/rustfmt.toml" "$target_dir/rustfmt.toml"

