#!/usr/bin/env bash

. scripts/common.sh

function ExportKeys () {
  Section "Exporting SSH keys"

  STORE=$HOME/dotfiles/host_keys
  KEYDIR=$STORE/`hostname -f`

  SSH=$HOME/.ssh
  PRIV=$SSH/id_dsa; PUB=$SSH/id_dsa.pub;

  if [[ -d $STORE ]]; then
    if [[ ! -d $KEYDIR ]]; then
      msg "Creating $KEYDIR"
      mkdir -p $KEYDIR;
    else
      msg "Key directory ($KEYDIR) already exists. Using existing key."
      #rm -rf $KEYDIR/*;
    fi;

    cp $PUB $PRIV $KEYDIR;
    msg "SSH keys saved to 'thechex' bucket"
  else
    msg "${STORE} directory does not exist."
    mkdir $STORE
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
Confirmation "Do you want to export your SSH keys to github? " ExportKeys;

NL;
Pause;
