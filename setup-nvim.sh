#!/bin/zsh

TRGT="$HOME/Projects/dotfiles/nvim"
LINKNAME="$HOME/.config"

ln -sf "$TRGT/$target" "$LINKNAME/$target"
