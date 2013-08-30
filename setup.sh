#!/usr/bin/env bash

git submodule init
git submodule update

. lib/globals.sh
. lib/txt.sh
. init/pkgman.sh 

Msg "Updating pkg manager.";
PkgUpdate;

. init/packages.sh # Installs various dev packages

echo "Placing dotfiles where they need to go.";
. init/linker.sh # Links dotfiles to $HOME. Unused atm.

# Set hostname
. init/hostname.sh

# Create new user account
. init/newuser.sh

# Only part of this whole damn script that doesn't need sudo.
## Generate / export ssh keys
# . init/ssh-keys.sh

Msg "Setup complete.";
Pause;
