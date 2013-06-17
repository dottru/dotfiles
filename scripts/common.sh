#!/usr/bin/env bash

function Print () {
	echo -e $@;
}

function NL () { Print "\n"; }

function Install () { Print "Installing $@..."; sudo aptitude -y install $@; }

function Remove () {
	Print "Permanently deleting $1...";
	rm -rf $1
}

function SymLink () {
	Remove $2;
	
	Print "Symbolic linking [ $1 ] ==> [ $2 ]";
	ln -s $1 $2;
}

SEP="======================="
function Seperator () {
  Print "\n$SEP\n$@";
}

function Title () {
	Print "$@";
	Seperator;
}

function Section() {
	Seperator;
	Print $@;
	Seperator "\n";
}

function ReMake () {
	Print "Re-creating $1"; Remove $1;
	MkDir $1;
}

function MkDir () {
	if [ -d $@ ]; then
		Print "Directory [ $@ ] already exists";
	else
		Print "Creating directory [ $@ ]";
		mkdir -p $1;
	fi
}

function Confirmation () {
	NL;
	read -p "$1? [y/N] " -n 1 -r;
	NL;

	if [[ $REPLY =~	^[Yy]$ ]]; then
    Print "Continuing..."
		RES=$($2);
		Print $RES;
	else
		Print "Cancelled."
	fi
}
