#!/usr/bin/env bash

## 
## pkgman.sh - exports $PKGMAN (i.e. /usr/bin/pacman)
##	           exports $DISTRO (i.e. archlinux or debian)
## 

. lib/txt.sh
. lib/control.sh

Section "Distro determination..."

function PkgInstall () {
    TARG="$@";
    Msg "Installing '$TARG'...";
    echo "`$PKGMAN $INST $TARG`";
}

function PkgUpdate () {
  Msg "Updating pkg manager.";
  echo "`$FOUND $PREP`";
}

function PackageMan () {
  # Choose between arch and debian
  ARCH_OPTS="--noconfirm"; DEB_OPTS="-y";

  # Try to locate archs pkgman
  PAC=`which pacman`; FOUND="";

  # If found arch
  if [[ ! -z $PAC ]]; then
      Title "Arch Linux";
      Msg "Found package manager, '$PAC'";

      FOUND="$PAC $ARCH_OPTS";
       DIST="archlinux";
       INST="-S";
       PREP="-Syu";

  # Otherwise, assume user has debian right?
  else
      Title "Debian Linux";
      Msg "Pacman is a lie. Assuming debian.";

      FOUND=`which aptitude`;
       DIST="debian";
       INST="install";
       PREP="update";
  fi;

  # Exports
  export PKGMAN="$FOUND";
  export DISTRO="$DIST";

  # Notify user of this fuckery
  Msg "Exporting PKGMAN to '$FOUND'.";
  PkgUpdate;
  Wait;  
  #Confirmation "Update package manager?" PkgUpdate;
}

# quit if not 0
RequireRoot PackageMan;
