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

PkgInstall tmux
PkgInstall vim
PkgInstall tree
PkgInstall htop
