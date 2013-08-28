#!/usr/bin/env bash

##
## Library methods for this shell setup.
##

# Text handling / processing methods
function pf () { printf "$@"; }      # printf
function NL ()    { pf "\n"; }       # newline
function SP ()    { pf " - "; }      # single sep
function Msg () { pf "%s\n" "$@"; }  # Msg printer
function sep () { pf "\r\n-------------------------------------\r\n"; }

# Title/Section denoters
function Title () { Msg "$@"; sep; }
function Section() { sep; Msg "$@"; sep; NL; }

# MatchCase 0 will make case statements insensitive
function MatchCase () {
	if [[ $1 -eq 0 ]]; then
		shopt -s nocasematch;
	elif [[ $1 -eq 1 ]]; then
		shopt -u nocasematch;
	fi;
}

function Err () { echo "Error: ${$@}."; }

function Install () {
	echo "$PKGMAN $_INST $@."
}
