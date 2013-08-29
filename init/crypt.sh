#!/usr/bin/env bash

clear;

. lib/txt.sh
. lib/control.sh

# password file
PF="$HOME/.password";
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
}

## }}

#
## Discovery stage
#
if [ ! -z $PASS ]; then
  # We do have a password.

  export REQ="$1";
  Msg "Converting file [$1]";
  
  if [ -f $REQ ]; then # verify input exists

    ext="${1##*.}"; # encrypted files end with .cpt

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
