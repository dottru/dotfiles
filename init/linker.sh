#!/usr/bin/env bash

. lib/txt.sh
. lib/control.sh

Section "Linking configs to $HOME"

Msg "tmux..."
ln -s $DOTFILES/link/tmux.conf $HOME/.tmux.conf

Msg "dir_colors..."
ln -s $DOTFILES/link/dircolors/dircolors.256dark ~/.dir_colors
