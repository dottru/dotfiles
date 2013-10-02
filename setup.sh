#!/usr/bin/env bash

  # Includes
. lib/control.sh
. lib/globals.sh
. lib/txt.sh


clear;
Section " -- dotfiles [[ SETUP ]]"; NL;
Msg     "  -  We will guide you through setup. One moment.";


#######################################
Msg "Updating git submodules.";
git submodule update --init --recursive
Pause;
#######################################


function PkgMan () {
    Msg "Running following script as root.";
    sudo bash ./init/pkgman.sh;
}
Confirmation "Run package manager discovery? " PkgMan;
Pause;

# Setup vim
. vim/setup.sh

Pause;

sudo bash init/packages.sh # Installs various dev packages

Pause;

# Links dotfiles to $HOME. Unused atm.
. init/linker.sh 

Pause;


# Set hostname
. init/hostname.sh

Pause;


# Create new user account
. init/newuser.sh

Pause;


# Decrypt secrets
. init/secrets.sh

Pause;


# S3 credentials
. init/s3-creds.sh
. init/buckets.sh

Pause;


# Only part of this whole damn script that doesn't need sudo.
## Generate / export ssh keys
. init/ssh-keys.sh

Msg "Setup complete.";
Pause;
