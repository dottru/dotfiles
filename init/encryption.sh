#!/usr/bin/env bash

# TODO :: translate to function

. init/txt.sh

function Encrypt () {
        SRC=$1; CRY=$SRC;
        cat $SRC | ccrypt > $SRC.crypt;

        #Confirmation "Add source to git ignore list? " IgnoreFile # TODO: re-add this
}

function Decrypt () {
        SRC=$1;

        filename=$(basename "$SRC")
        extension="${filename##*.}"
        DEST="${filename%.*}"

        cp $SRC $DEST;
        ccrypt -d $DEST;

        echo "$DEST decrypted."
}

  # Not used right now.
  # function IgnoreFile () {
  #   # if src not in gitignore, add it
  #   GITI=".gitignore"
  #   SEARCH=`egrep -i "^$CRY" $GITI`

  #   if [[ -z $SEARCH ]]; then
  #     msg "Adding $CRY to $GITI"
  #     echo "$CRY" >> $GITI;
  #   else
  #     msg "File is already in $GITI"
  #   fi;
  # }
