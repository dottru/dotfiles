#!/usr/bin/env bash

. lib/txt.sh
. init/pkgman.sh

Section "Installing required packages."

PkgInstall tmux   # for term multiplexing,
PkgInstall vim    # for owning everyone
PkgInstall tree   # for navigating dir trees
PkgInstall htop   # for multiplexing
PkgInstall ccrypt # for encryption
PkgInstall ctags  # for tab completion
PkgInstall nodejs # for some of the scripting
PkgInstall s3cmd  # interface for s3
PkgInstall sudo   # fuckin, arch doesn't come with sudo!?
