#!/usr/bin/env bash

. lib/txt.sh
. lib/control.sh
. lib/crypt.sh

SPWD=$HOME/.s3cfg;
CPWD="copy/s3cfg.$CRYPT_EXT";

QuitOnExit;

Section "S3 Credentials";

if [ -f $SPWD ]; then
  Msg "S3cmd config exists. Exiting.";
  exit 0;
else

  if [ -f $CPWD ]; then
    function DoIt () {
      Msg "Decrypting credentials.";
      export OUT=$SPWD;
      export IN=$CPWD;
      
      Decrypt $OUT;
      Msg "S3cmd configured properly.";
    }
    Confirmation "Decrypt S3 creds?" DoIt;
  else
    Msg "Running S3CMD --configure";
    s3cmd --configure
  fi;

fi;
