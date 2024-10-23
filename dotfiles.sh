#!/bin/zsh

TRGT="$HOME/Projects/dotfiles"
LINKNAME="$HOME/.config"

TRGT_LIST=(alacritty hypr waybar rofi)

for target in $TRGT_LIST; do
    ln -sfT "$TRGT/$target" "$LINKNAME/$target"
done

# TODO:
# https://asus-linux.org/manual/asusctl-manual/
# setting up asusd-user
