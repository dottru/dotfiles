#!/usr/bin/env bash

. lib/control.sh        # control flow
. lib/globals.sh        # global vars
. lib/txt.sh            # text formatting
. lib/git.sh # will set the remote uri for `pwd`

#######################################

    BRANCH=`git rev-parse --abbrev-ref HEAD`;

    Section " jmkogut's dotfiles repository ";
    Msg " pwd    --`pwd`";
    Msg " branch -- ${BRANCH}";
    Pause;

#######################################
Msg "Updating git submodules.";
git submodule update --init --recursive
Pause;
#######################################

### Pkg Manager
function PkgMan () {
    Msg "Running following script as root.";
    sudo bash ./init/pkgman.sh;
    sudo bash ./init/packages.sh # Installs various dev packages
}
Confirmation "Run package manager discovery? " PkgMan;
###


# Setup vim
. vim/setup.sh
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
