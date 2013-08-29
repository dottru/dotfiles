#!/usr/bin/env bash



# {{ Host information
  function GetFQDN () { echo `cat /etc/hostname`; }

  function UID () { echo `id -u`; }

  function FullPath() { echo `readlink -f $0`; }
# }}

# {{ Filesystem operations
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
    RemoveIfExists $2;
    msg "Symbolic linking [ $1 ] ==> [ $2 ]";
    ln -s $1 $2;
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
# }}

# {{ Control flow

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
    echo "This script requires elevated privileges. Exiting."
    Pause;
  }
# }}

# {{ File encryption
  CRY=""

