#!/usr/bin/env bash

. lib/control.sh;
. lib/txt.sh;

Section "VIM Setup";

Msg "Cloning vim cfgs.";
rm -rf ~/.vim ~/.vimrc;
git clone git@github.com:dottru/vim.git ~/.vim
ln -s ./lib ~/.vim/lib;

Pause;
~/.vim/setup.sh;
Pause;
