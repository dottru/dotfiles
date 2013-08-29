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
function inp() { read -r -p "$1"; }

# Title/Section denoters
function Title () { Msg "$@"; sep; }
function Section() { sep; Msg "$@"; sep; NL; }

# Pause for input
function Pause () { read -p "[Enter to continue...]"; }

# Indicators
function Success () { echo "Success."; }
function Fail    () { echo "Failure."; }
