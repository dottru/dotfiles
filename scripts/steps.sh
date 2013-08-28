#!/usr/bin/env bash

function Main () {
  VariableDefs;
  
  Section "Configured Paths.";

  justi "Home" "$HOME";  justi "Configs" "$DF"; NL;
  justi "VIM" "$VIMDIR"; justi "VIMRC" "$VIMRC"; NL;
  
  Section "Setup will destroy your existing dotfiles. Use carefully.";
  msg "This repo is designed for use with fresh EC2 instances. As such,"
  msg "it has absolutely no regard for data safety. It deletes things at random."
  NL;

  Pause;
  
 VimSetup;
 Pause;

 GitSetup;
 Pause;

 FishSetup;
 Pause;
}

function VimSetup () {
  Section "VIM configs"

  if [[ ! -L $VIMDIR ]]; then
    msg "Updating vim bundles.";

    git submodule init
    git submodule update

    SymLink $DF/vim/config.vimrc $VIMRC ;
    SymLink $DF/vim $VIMDIR;

    Title "Linking pathogen.vim bundle...";
    p="pathogen";
    MkDir $VIMDIR/autoload;
    SymLink $VIMDIR/bundle/$p/autoload/$p.vim $VIMDIR/autoload/$p.vim;
  else
    msg "$VIMDIR is already a symlink. Skipping vim config."
  fi;
}

function VariableDefs () {
  # common dirs
  HOME=~
  DF=$HOME/dotfiles
  BAK=/tmp/script_backups
  CFG=$HOME/.config

  # vim dirs
  VIMDIR=$HOME/.vim
  VIMRC=$HOME/.vimrc
  
  # labels
  ID=`whoami`@`hostname`;
  SEP="========================="

}

function GitSetup () {
  Section "Git configuration";

	Title "Linking git config."
	SymLink $DF/gitconfig $HOME/.gitconfig
}

function FishSetup () {
  Section "Shell customisations"
  Install "community/fish"

  chsh -s /usr/bin/fish # TODO: confirm do

  msg "Default shell changed to 'fish' shell."
  msg " * Reset to bash with [ chsh -s `whereis bash` ] *"

  # sym fish config
  FISH=$CFG/fish

  RemoveIfExists $FISH;
  SymLink $DF/fish $FISH
}

