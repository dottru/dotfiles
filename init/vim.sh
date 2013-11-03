#!/usr/bin/env bash

. lib/controls.sh;
. lib/txt.sh;

Section "VIM Setup";

Msg "Cloning vim cfgs.";
git clone git@github.com:dottru/vim.git ~/.vim

~/.vim/setup.sh;
Pause;
