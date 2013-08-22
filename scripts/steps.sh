#!/usr/bin/env bash

function Main () {
  VariableDefs;
  
  Section "Configured Paths.";

  justi "Home" "$HOME";  justi "Configs" "$DF"; NL;
  justi "VIM" "$VIMDIR"; justi "VIMRC" "$VIMRC"; NL;
  
  Section "Setup will destroy your existing dotfiles. Use carefully.";
  
  #Confirmation "Configure VIM" VimSetup;
 VimSetup;
 GitSetup;
 FishSetup;
}

function VimSetup () {
  Section "VIM configs"

  msg "Updating vim bundles.";

  git submodule init
  git submodule update

  SymLink $DF/vim/config.vimrc $VIMRC ;
  SymLink $DF/vim $VIMDIR;

  Title "Linking pathogen.vim bundle...";
  p="pathogen";
  MkDir $VIMDIR/autoload;
  SymLink $VIMDIR/bundle/$p/autoload/$p.vim $VIMDIR/autoload/$p.vim;
  
#  Confirmation "Install JSHint" JSHintSetup;
}

#MiscSetup; 
  #GitSetup;
  #SSHSetup;
  #FishSetup; #SudoSetup;


function MiscSetup () {
  msg "No miscing to be found here."
  #msg "Fixing nodejs sym link."
  #SudoSymLink `which nodejs` /usr/bin/node;
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

function CtagSetup () {
  install exuberant-ctags
}

function JSHintSetup () {
  msg "Installing jshint."
  Install nodejs
  sudo npm install jshint -g
}


function GitSetup () {
	Title "Linking git config."
	SymLink $DF/gitconfig $HOME/.gitconfig
}

function SSHSetup () {
  PUBKEY=$HOME/.ssh/id_rsa.pub
  DEST=$DF/ssh_keys/$ID.pub

  Title "SSH configuration"

  if [ ! -f $PUBKEY ]; then
    msg "Generating SSH key for $ID"
    ssh-keygen -q -t rsa -f ~/.ssh/id_rsa -N ""
    cat $PUBKEY >> $DEST 
    git add $DEST && git commit -m "Generated pubkey for $ID" && git push
  else
    echo "No need to generate an ssh key..."
  fi
}

function SudoSetup () {
  bash as_root.sh;
}

function FishSetup () {
  Section "Shell customisations"
  Install "community/fish"

  chsh -s /usr/bin/fish # TODO: confirm do

  msg "Default shell changed to 'fish' shell."
  msg " * Reset to bash with [ chsh -s `whereis bash` ] *"

  # sym fish config
  FISH=$CFG/fish
  SymLink $DF/fish $FISH
}

#function MainEC2 () {
  #Section  "EC2 Tools"
  #Install java7-jdk
  #Install ec2-api-tools
  #cat ./ec2_vars.sh >> ~/.bashrc # bashrc conf
#}

