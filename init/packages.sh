#!/usr/bin/env bash

. init/pkgman.sh
. init/lib.sh

case $DISTRO in
	# update shit
	archlinux) $PKGMAN -Ssy;; 
	debian)    $PKGMAN update;;
    *)

	echo "Unknown distro. Exiting.";
	exit 1;
esac

Section "Installing required packages."

PkgInstall tmux   # for term multiplexing,
PkgInstall vim    # for owning everyone
PkgInstall tree   # for navigating dir trees
PkgInstall htop   # for multiplexing
PkgInstall ccrypt # for encryption
PkgInstall ctags  # for tab completion
PkgInstall nodejs # for some of the scripting
