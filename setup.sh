#!/usr/bin/env bash

. lib/globals.sh
. lib/txt.sh
. init/pkgman.sh 

Msg "Pulling submodules."
git submodule update --init --recursive

# Setup vim
. vim/setup.sh

Msg "Updating pkg manager.";
PkgUpdate;

. init/packages.sh # Installs various dev packages

# Links dotfiles to $HOME. Unused atm.
. init/linker.sh 

# Set hostname
. init/hostname.sh

# Create new user account
. init/newuser.sh

# Decrypt secrets
. init/secrets.sh

# Only part of this whole damn script that doesn't need sudo.
## Generate / export ssh keys
# . init/ssh-keys.sh

Msg "Setup complete.";
Pause;
