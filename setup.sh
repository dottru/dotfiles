#!/usr/bin/env bash

HOME=~
DF=$HOME/dotfiles
BAK=/tmp/script_backups

echo "CD [$HOME]"
cd $HOME

echo "BAK [$BAK]"

echo "Re-creating backup dir."
rm -rf $BAK;
mkdir $BAK

# set vim vars
VIMDIR=$HOME/.vim/
VIMRC=$HOME/.vimrc

# bak vim confs
echo "vim dir [$VIMDIR] conf [$VIMRC]"
rm -rf $VIMDIR
rm -rf $VIMRC

echo "Symlinking the vim bullshits"
ln -s $DF/vim $VIMDIR
ln -s $DF/vim/config $VIMRC 

