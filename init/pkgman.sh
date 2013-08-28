#!/usr/bin/env bash

# Choose between arch and debian
function DoPacman () { echo "$1 --no-confirm"; }
function DoDebian () { echo "$1 -y"; }

# Try to locate archs pkgman
PAC=`which pacman`
FOUND="";

# If found pacman
if [[ ! -z $PAC ]]; then
	echo "Found package manager, '$PAC'"
	FOUND=`DoPacman "$PAC"`;
	DIST="archlinux";

# Otherwise, assume user has debian right?
else
	DB=`which aptitude`
	echo "Pacman is a lie. Assuming debian for '$DB'."
	FOUND=`DoDebian "$DB"`
	DIST="debian";
fi;

echo "Exporting PKGMAN to '$FOUND' [ ... ]"

# Exports
export PKGMAN="$FOUND"
export DISTRO="$DIST"
