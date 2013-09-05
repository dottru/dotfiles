#!/usr/bin/env bash

. lib/txt.sh
. lib/control.sh

ln -s $DOTFILES/link/tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES/link/dircolors/dircolors.256dark ~/.dir_colors
