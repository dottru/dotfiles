#!/usr/bin/env bash

# {{ Control flow

  # MatchCase 0 will make case statements insensitive
  function MatchCase () {
    if [[ $1 -eq 0 ]]; then
      shopt -s nocasematch;
    elif [[ $1 -eq 1 ]]; then
      shopt -u nocasematch;
    fi;
  }

  function Confirmation () {
    PROMPT=$1; DOIF=$2;

    NL;
    read -p "$PROMPT? [y/N] " -n 1 -r;
    NL;

    if [[ $REPLY =~	^[Yy]$ ]]; then
      $DOIF;
      return 0;
    else
      msg "Cancelled."
      return 1;
    fi
  }

  function DidSucceed () {
    R=$1; POSI=$2; NEGI=$3;
    if [[ $R -eq 0 ]]; then
      POSI;
    else
      NEGI;
    fi;

    return $R;
  }
# }}

# {{ Run level
  function AsRoot () {
    msg "Elevating user privileges..."
    sudo bash $SCRIPT; # if have probs use $0
  }

  function UID () {
    Msg "`id -u $@`";
  }

  function RequireRoot () {
    DO=$1; FAIL=$2;

    if [[ $(UID) -ne 0 ]]; then
      $FAIL;
      return 1;
    else
      $DO;
      return 0;
    fi;
  }

  function NeedsRoot () {
    Msg "This script requires elevated privileges. Exiting."
    Pause;
  }
