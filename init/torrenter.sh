#!/usr/bin/env bash

. lib/txt.sh
. init/pkgman.sh

Section "Torrenting packages."

PkgInstall transmission-cli 
PkgInstall transmission-remote-cli 
