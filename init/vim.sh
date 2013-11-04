#!/usr/bin/env bash

. lib/control.sh;
. lib/txt.sh;

Section "VIM Setup";

Msg "Cloning vim cfgs.";
rm -rf ~/.vim ~/.vimrc;
git clone git@github.com:dottru/vim.git ~/.vim

Msg "Symlinking lib to ~/.vim";
rm -rf ~/.vim/lib;
ln -s ~/dotfiles/lib ~/.vim/lib;

Pause;
~/.vim/setup.sh;
Pause;
