#!/bin/zsh

TRGT="$HOME/Projects/dotfiles"
LINKNAME="$HOME/.config"

TRGT_LIST=(alacritty hypr waybar)

for target in $TRGT_LIST; do
    ln -sfT "$TRGT/$target" "$LINKNAME/$target"
done
