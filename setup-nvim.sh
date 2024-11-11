#!/bin/zsh

TRGT="$HOME/Projects/dotfiles/nvim"
LINKNAME="$HOME/.config"

ln -sfT "$TRGT/$target" "$LINKNAME/$target"
