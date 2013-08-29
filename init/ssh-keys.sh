#!/usr/bin/env bash

. lib/txt.sh
. lib/control.sh

function ExportKeys () {
  Section "Exporting SSH keys"

  # SSH keys on local machine
  SSH=$HOME/.ssh
  PRIV=$SSH/id_dsa; PUB=$SSH/id_dsa.pub;

  # SSH pubkey destination
  STORE="$HOME/dotfiles/host_keys"
  KEYPUB="$STORE/`whoami`-at-`hostname`.pub"

  # If store exists, copy the pubkey over
  if [[ -d $STORE ]]; then
    if [[ ! -f $KEYPUB ]]; then
      Msg "Pub key spot is available."
      
      cp $PUB $KEYPUB;
      pushd $STORE;
      git commit -a -m 'Added key for `whoami`@`hostname`'
      git push origin master
      popd;

      Msg "SSH keys saved to github repo.";
    else
      Msg "SSH key $KEYPUB already exists. Skipping";
    fi;

  else
    Msg "${STORE} directory does not exist."
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
Confirmation "Do you want to export your SSH keys to github repo dottru/hostkeys? " ExportKeys;

NL;
Pause;
