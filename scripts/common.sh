#!/usr/bin/env bash

export TMP=/tmp


# Term width "-" line (tput cols wide)
function sep () { printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -; }

function pf () { printf "$@"; }      # printf
function NL ()    { pf "\n"; }       # newline
function SP ()    { pf " - "; }      # single sep
function msg () { pf "%s\n" "$@"; }  # msg printer
function justi () {                  # text justifier
  pf "%10s :: %-20s" "$1" "$2";
}

# Installs utils via apt
function Install () {
	msg "Installing $@...";
	sudo aptitude -y install "$@";
}

# Removes items from filesystem
function Remove () {
	msg "Permanently deleting $1...";
	rm -rf $1;
}

function SudoSymLink () {
	RemoveIfExists $2;

	msg "Symbolic linking [ $1 ] ==> [ $2 ]";
	sudo ln -s $1 $2;
}


# Checks for existence before removal.
function RemoveIfExists () {
  msg "Checking if $1 exists...";
  if [ -e $1 ]; then
    Remove $1;
  fi

  if [ -L $1 ]; then
    Remove $1;
  fi
}


function SymLink () {
	#msg "Attempting to symlink $1 to $2"
	RemoveIfExists $2;
	
	msg "Symbolic linking [ $1 ] ==> [ $2 ]";
	ln -s $1 $2;
}

function Title () {
  msg "$@"; sep;
}

function Section() {
  sep;
  msg "$@";
  sep; NL;
}

function ReMake () {
	msg "Re-creating $1";
	Remove $1;
	MkDir $1;
}

function MkDir () {
	if [ -d $@ ]; then
		msg "Directory [ $@ ] already exists";
	else
		msg "Creating directory [ $@ ]";
		mkdir -p $1;
	fi
}

function Confirmation () {

	NL;
	read -p "$1? [y/N] " -n 1 -r;
	NL;

	if [[ $REPLY =~	^[Yy]$ ]]; then
		RES=$($2);
		msg "RES - $RES | FUN $2";
	else
		msg "Cancelled."
	fi
}
