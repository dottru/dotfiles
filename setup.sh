#!/usr/bin/env bash

echo "Installing a few required packages first.";

. init/pkgman.sh   # Determines which pkg this sys uses
. init/packages.sh # Installs various dev packages

echo "Placing dotfies where they need to go.";
. init/linker.sh # Links dotfiles to $HOME

# Set hostname
. init/hostname.sh

# Create new user account
. init/newuser.sh

# Generate / export ssh keys
 . init/ssh-keys.sh

 # Export SSH keys to github
 . init/export_ssh.sh

msg "Setup complete.";

Pause;
