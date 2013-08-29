#!/usr/bin/env bash

  # MatchCase 0 will make case statements insensitive
  function MatchCase () {
    if [[ $1 -eq 0 ]]; then
      shopt -s nocasematch;
    elif [[ $1 -eq 1 ]]; then
      shopt -u nocasematch;
    fi;
  }

  function Backup () {
    if [ -f "$1" ]; then
      mv "$1" /tmp;
      Msg "Your file, $1 has been moved to /tmp.";
    fi;
  }

  # First arg is prompt, second is a method to call if user hits 'Y'
  function Confirmation () {
    PROMPT=$1; DOIF=$2;

    NL;
    read -p "$PROMPT? [y/N] " -n 1 -r;
    NL;

    if [[ $REPLY =~	^[Yy]$ ]]; then
      export RESULT="${DOIF}";
      Msg "Result: $RESULT";
      return 0;
    else
      Msg "Cancelled."
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
  
  function AsRoot () {
    Msg "Elevating user privileges..."
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


  function IgnoreFile () {
   # if src not in gitignore, add it
   GITI=".gitignore"
   SEARCH=`egrep -i "^$CRY" $GITI`

   if [[ -z $SEARCH ]]; then
     Msg "Adding $CRY to $GITI"
     echo "$CRY" >> $GITI;
   else
     Msg "File is already in $GITI"
   fi;
  }
