#!/usr/bin/env bash

. scripts/common.sh

function GenerateKey () {
  ssh-keygen -t dsa
}

Section "SSH keys"
Confirmation "Do you want to generate new SSH keys? " GenerateKey
