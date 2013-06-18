#!/usr/bin/env bash

. scripts/common.sh


# /funclW"nyWV/^}"kb"by:tabe kdnkb.shp\w


function VariableDefs () {
	VIMDIR=$HOME/.vim
	VIMRC=$HOME/.vimrc
	
	ID=`whoami`@`hostname`;
	SEP="========================="

	# Script path
	SCRIPT_PATH="${BASH_SOURCE[0]}";
	if ([ -h "${SCRIPT_PATH}" ]) then
		while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
	fi
	pushd . > /dev/null
	cd `dirname ${SCRIPT_PATH}` > /dev/null
	DF=`pwd`;
	popd  > /dev/null
	# / script path

	# common dirs
	HOME=~
	BAK=/tmp/script_backups
}

function JSHintSetup () {
  Print "Installing jshint."
  sudo npm install jshint -g
}

function VimSetup () {
	Title "Symlinking vim settings.";
	SymLink $DF/vim/config $VIMRC 
	SymLink $DF/vim $VIMDIR

	Title "Linking pathogen.vim bundle..."
	p="pathogen"
	MkDir $VIMDIR/autoload
	SymLink $VIMDIR/bundle/$p/autoload/$p.vim $VIMDIR/autoload/$p.vim
  
  Confirmation "Install JSHint" JSHintSetup;
}

function GitSetup () {
	Title "Linking git config."
	SymLink $DF/gitconfig $HOME/.gitconfig
	Title "Asking git to cache user credentials..."
	git config --global credential.helper 'cache --timeout=360000'
}

function SSHSetup () {
	PUBKEY=$HOME/.ssh/id_rsa.pub
	DEST=$DF/ssh_keys/$ID.pub

	Title "SSH configuration"

	if [ ! -f $PUBKEY ]; then
		Print "Generating SSH key for $ID"
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
	Install fish
	Print "Default shell changed to 'fish' shell."
	Print " * Reset to bash with [ chsh -s `whereis bash` ] *"
	chsh -s /usr/bin/fish
	# TODO: add fish config file
}

#function MainEC2 () {
	#Section	"EC2 Tools"
	#Install java7-jdk
	#Install ec2-api-tools
	#cat ./ec2_vars.sh >> ~/.bashrc # bashrc conf
#}

function MiscSetup () {
  Print "Fixing nodejs sym link."
  SudoSymLink `which nodejs` /usr/bin/node;
}

function MakeChanges () {
	MiscSetup; 
  
  VimSetup;

	#GitSetup;

	#SSHSetup;
	
  #FishSetup;

	#SudoSetup;
}

function Main () {
  VariableDefs;
	
  Section "Configured Paths.";

	Print "Home    --  $HOME | VIM    --  $VIMDIR";
	Print "CFGs    --  $DF | VI RC  --  $VIMRC";
  
  Section "Setup will destroy your existing dotfiles. Use carefully.";
  
  Confirmation "Continue setup" MakeChanges;
}

Main;
