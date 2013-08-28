#!/usr/bin/env bash

. scripts/common.sh

function ExportKeys () {
  Section "Exporting SSH keys"

  msg "Looking for S3 bucket..."

  STORE=$HOME/s3/thechex
  KEYDIR=$STORE/keys/`hostname -f`

  SSH=$HOME/.ssh
  PUB=$SSH/id_dsa; PRIV=$SSH/id_dsa.pub;

  if [[ -d $STORE ]]; then
    if [[ ! -d $KEYDIR ]]; then
      msg "Creating $KEYDIR"
      mkdir -p $KEYDIR;
    else
      msg "Key directory ($KEYDIR) already exists. Overwriting."
      rm -rf $KEYDIR/*;
    fi;

    cp $PUB $PRIV $KEYDIR;
    msg "SSH keys saved to 'thechex' bucket"
  else
    msg "S3 bucket `thechex` is not mounted. Please do so before continuing..."
    msg "(Looking for bucket at ~/s3/thechex)"
    NL;

    Pause;
    ExportKeys;
  fi;
}

function GenerateKey () {
  ssh-keygen -t dsa
}

Section "SSH keys"
Confirmation "Do you want to generate new SSH keys? " GenerateKey;
Confirmation "Do you want to export your SSH keys to S3? " ExportKeys;

NL;
Pause;
