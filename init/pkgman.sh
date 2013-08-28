#!/usr/bin/env bash

## 
## pkgman.sh - exports $PKGMAN (i.e. /usr/bin/pacman)
##	       exports $DISTRO (i.e. archlinux or debian)
## 

. init/lib.sh

Section "Distro determination..."

# Choose between arch and debian
ARCH_OPTS="--noconfirm"; DEB_OPTS="-y";

# Try to locate archs pkgman
PAC=`which pacman`; FOUND="";

# If found arch
if [[ ! -z $PAC ]]; then
	Title "Arch Linux";
	Msg "Found package manager, '$PAC'";

	FOUND=`$PAC $ARCH_OPTS`;
	DIST=archlinux;
	INST="-S";
	PREP="-Ssy";

# Otherwise, assume user has debian right?
else
	Title "Debian Linux";
	Msg "Pacman is a lie. Assuming debian.";

	FOUND=`which aptitude`;
	DIST=debian;
	INST=install;
	PREP=update;
fi;

# Notify user of this fuckery
Msg "Exporting PKGMAN to '$FOUND' [ ... ]";
Msg "Updating [$DIST] package manager.";
Msg PkgUpdate;

# Exports
export PKGMAN="$FOUND";
export DISTRO="$DIST";

function PkgInstall () {
	TARG="$@";
	Msg "Installing '$TARG'...";
	Msg "`$PKGMAN $INST $TARG`"; }

function PkgUpdate () {
	Msg "Updating pkg manager.";
	Msg "`$FOUND $PREP`"; }
