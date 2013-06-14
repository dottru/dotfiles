#!/usr/bin/env bash
clear
function ClearWay () {
	echo "Permanently deleting $1...";
	rm -rf $1
}

function LinkIt () {
	ClearWay $2;
	
	echo "Linking [ $1 ] ==> [ $2 ]";
	ln -s $1 $2;
} 
function Title () {
	echo -e  "\r\n=========\r\n$1\r\n"
}
function ReMake () {
	echo "Re-creating $1";
	rm -rf $1;
	mkdir $1;
}


# common dirs
HOME=~
DF=$HOME/dotfiles
BAK=/tmp/script_backups

# set vim vars
VIMDIR=$HOME/.vim
VIMRC=$HOME/.vimrc

# =====
# INTRO
# =====
echo "home  --  $HOME | vimd  --  $VIMDIR"
echo "dotf  --  $DF | virc  --  $VIMRC"
echo -e "back  --  $BAK \r\n====================\r\n"

# VIM cfgs
Title "Symlinking the vim bullshits"
LinkIt $DF/vim/config $VIMRC 
LinkIt $DF/vim $VIMDIR

Title "Linking pathogen.vim..."
p="pathogen"
LinkIt $VIMDIR/bundle/$p/autoload/$p.vim $VIMDIR/autoload/$p.vim
