#!/usr/bin/env bash

# --------------
# --------------

. lib/txt.sh
. lib/control.sh
. lib/crypt.sh

set -e; # Quit on exit failure


# ---------------------------
# ---------------------------
# --  Begin procedure.

clear;

Section "Encrypted file interface."

# Check for empty input
if [ -z $1 ]; then
  Section "Usage";
  Msg "    $0 \$DIR/file.ext";
  Msg "      - encrypts the file to \$1.$CRYPT_EXT";
  NL;
  Msg "    $0 \$DIR/file.ext.$CRYPT_EXT";
  Msg "      - decrypts the file to \$1 sans .$CRYPT_EXT";

  exit 1;
fi;

export IN=$1;
Msg "Input file [$IN]...";

# verify input exists
if [ -f $IN ]; then 
  ext="${1##*.}"; # encrypted files end

  if [ $CRYPT_EXT == "${ext}" ]; then
    Msg "Decrypting [$IN].";
    Decrypt;
  else
    Msg "Encryting [$IN].";
    Encrypt;
  fi;
else
  # Input likely didn't exist.
  Msg "Could not open input file.";
  exit 1;
fi;
