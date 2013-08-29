#!/usr/bin/env bash

echo "Installing a few required packages first.";

. lib/txt.sh
. init/pkgman.sh   # Determines which pkg this sys uses

# Update the local package manager.
PkgUpdate;

. init/packages.sh # Installs various dev packages

echo "Placing dotfiles where they need to go.";
#. init/linker.sh # Links dotfiles to $HOME. Unused atm.

# Set hostname
. init/hostname.sh

# Create new user account
. init/newuser.sh

# Generate / export ssh keys
 . init/ssh-keys.sh

Msg "Setup complete.";
Pause;
