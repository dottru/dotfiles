#!/usr/bin/env bash

export DF_BRANCH="debfix";

. lib/txt.sh
. lib/control.sh

function GetIdentity () { echo "`whoami`@`hostname`"; }

function ExportKeys () {
  Section "Exporting SSH keys"
  Msg "Copy the following pubkey to github for [ `whoami`@`hostname -f` ]";
  NL;

  cat ~/.ssh/id_dsa.pub;
  NL;
  Pause;

  # SSH keys on local machine
  SSH=$HOME/.ssh
  PRIV=$SSH/id_dsa; PUB=$SSH/id_dsa.pub;

  # SSH pubkey destination
  STORE="$HOME/dotfiles/host_keys"
  KEYPUB="$STORE/$(GetIdentity).pub"

  # If store exists, copy the pubkey over
  if [[ -d $STORE ]]; then
    if [[ ! -f $KEYPUB ]]; then
      Msg "Copying loca pubkey to git repo.";
      Msg "  [ ${KEYPUB} ]";
      
      cp $PUB $KEYPUB;
      pushd $STORE;
      git commit -a -m 'Added key for $(GetIdentity)'
      git push origin $DF_BRANCH
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
