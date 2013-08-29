#!/usr/bin/env bash

clear;

. lib/txt.sh
. lib/control.sh

set -e; # Quit on exit failure

# password file
PF="$HOME/.password";

# If file was supplied and has basename of password
if [ ! -z "$1" ]; then # non-zero
 if [ -f $1 ]; then    # is-a-file
  N=`basename "$1"`;
  
  if [ $N == "password" ]; then
    Msg "Replacing old password with this one.";
    BK="$HOME/.password-old"

    mv "$PF" "$BK";
    Msg "Old passfile backed up at $BK.";

    Msg "New password copied to $PF"; # TODO :: dont store passwords in plain txt anymore
    mv "$1" "$PF";
    exit 1;
  fi;
fi;
fi;

export PASS=`cat "$PF"`;

## {{ Crypt methods
function Encrypt () {
  IN=$REQ; GO="${REQ}.cpt";
  echo `Backup $GO`;

  cat "$REQ" | ccrypt -e -E PASS > "$GO";
  Msg "Encrypted file available at [$GO].";
}

function Decrypt () {
  IN=$REQ; GO="${REQ%.*}";
  echo `Backup $GO`;

  cat "$REQ" | ccrypt -d -E PASS > "$GO";
  Msg "Decrypted file available at [$GO].";
  echo `IgnoreFile "$GO"`;
}

## }}

#
## Discovery stage
#
if [ ! -z $PASS ]; then
  # We do have a password.
  [ -z $1 ] && R="copy/s3.pass.cpt" || R="$1"

  export REQ="$R";
  Msg "Converting file [$R]";
  
  if [ -f $REQ ]; then # verify input exists

    ext="${R##*.}"; # encrypted files end with .cpt

    if [ "cpt" == "${ext}" ]; then
      Msg "Encrypted file supplied. Decrypting.";
      Decrypt;

    else
      Msg "Unencrypted file supplied. Encrypting.";
      Encrypt;
    fi;

  else
    # Input likely didn't exist.
    Msg "Could not open input file.";
    exit 1;
  fi;

else
  Msg "No password file.";
  Msg "This script expects a pass file at [ $PF ];";
  exit 1;
fi
