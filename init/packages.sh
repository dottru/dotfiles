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
