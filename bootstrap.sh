#!/usr/bn/env bash

REPO="jmkogut/dotfiles"
BRANCH="archlinux"
BRANCH="master"
BOOTSTRAP="http_bs.sh"
SETUP="setup.sh"
RAWURI="https://raw.github.com/$REPO/$BRANCH/"
GH_URI="https://github.com/$REPO.git"
PKG="sudo pacman --noconfirm "
install () {
  $PKG -Sy $*;
}

cd ~

echo "Updating package manager."
$PKG -Ssy

echo "Installing git/wget/tmux."
install git
install wget
install tmux

echo "Cloning $GH_URI."
git clone $GH_URI
cd dotfiles;
git fetch origin $BRANCH;
git checkout $BRANCH;

echo "Running bootstrap."
./setup.sh
