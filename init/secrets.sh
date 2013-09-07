#!/usr/bin/env bash

# --------------
# --------------

. lib/txt.sh
. lib/control.sh
. lib/crypt.sh

clear;

Section "Encrypted files.";

function DoIt () {
  Decrypt $OUT;
}

for file in copy/*.$CRYPT_EXT; do
  BASE=`basename ${file}`;
  NOXT=${BASE%.*};

  export IN=$file;
  export OUT="$HOME/.${NOXT}";

  Confirmation "Decrypt ${IN} to [${OUT}]." DoIt
done;
