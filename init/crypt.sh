#!/usr/bin/env bash

clear;

. lib/txt.sh
. lib/control.sh

function Encrypt () {
  echo "$REQ";
  cat "$1" | ccrypt -e -E PASS > "$2";
}

function Decrypt () {
  IN=$REQ; GO="${REQ%.*}";
  Msg "Decodng $REQ to $GO if it exists.";
  mv $GO /tmp;
  cat "$REQ" | ccrypt -d -E PASS > "$GO";
  echo `cat $GO`;
}

# function Decide () {
#   if [ $1 == "*.cpt" ]
#   then Decrypt "$1" "${1%.*}";
#   else Encrypt "$1" "$1.cpt";
#   fi }

# Check for password
PF="$HOME/.password";
export PASS=`cat "$PF"`;

if [ ! -z $PASS ]; then
  Msg "Password found.";

  export REQ="$1";
  Msg "Cnverting file [$1]";
  
  if [ -f $REQ ]; then
    Msg "File exists.";

    ext="${1##*.}"; # parse ext
  
    if [ "cpt" == "${ext}" ]; then
      Msg "Ends in cpt.";
      Decrypt;
    else
      Msg "Not encrypted.";
      Encrypt;
    fi;

  else
    Msg "File did not exist.";
  fi;

else
  Msg "No password file.";
fi
