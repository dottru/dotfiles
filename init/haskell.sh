#!/usr/bin/env bash

. init/txt.sh
. init/pkgman.sh

Section "Installing packages for haskell development."

PkgInstall ghc   # haskie compiles
PkgInstall happy # some needed lib
PkgInstall cabal-install # haskie pkg man
