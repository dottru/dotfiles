#!/usr/bin/env bash

. lib/txt.sh
. init/pkgman.sh

Section "Installing packages for haskell development."

PkgInstall ghc   # haskie compiles
PkgInstall happy # some needed lib
PkgInstall cabal-install # haskie pkg man

Msg "Updating cabal."
cabal update

# yesod
cabal install yesod-platform
cabal install yesod-bin
