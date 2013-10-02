#!/usr/bin/env bash

clear; 

. lib/control.sh        # control flow
. lib/globals.sh        # global vars
. lib/txt.sh            # text formatting

  # Fixes local git uri so password gets cached
. lib/git.sh # will set the remote uri for `pwd`


#######################################

    Section " jmkogut's dotfiles repository ";
    Msg " using branch // $(GetBranch) //";

#######################################
exit 1; 


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
