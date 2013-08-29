#!/usr/bin/env bash

. lib/txt.sh
. lib/control.sh

. init/crypt.sh

S3FILE="copy/s3pass";
S3FILE2="copy/s3pass.cpt";


function En () {
  Encrypt "$S3FILE";
}

function Dec () {
  Decrypt "$S3FILE.crypt";
}

if [[ -f $S3FILE ]]; then
    Confirmation "Encrypt your creds?" En;
elif [[ -f $S3FILE2 ]]; then
    Confirmation "How about a decrypt?" Dec;
fi;

