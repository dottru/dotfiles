#!/usr/bn/env bash

REPO="dottru/dotfiles"
BRANCH="master"
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
install tree
install htop

echo "Cloning $GH_URI."
git clone $GH_URI
cd dotfiles;
git fetch origin $BRANCH;
git checkout $BRANCH;

read -p "[Enter to run setup...]";

echo "Running bootstrap."
./$SETUP
