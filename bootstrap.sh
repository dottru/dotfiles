#!/usr/bn/env bash

REPO="jmkogut/dotfiles"
BRANCH="archlinux"
BRANCH="master"
BOOTSTRAP="http_bs.sh"
SETUP="setup.sh"
RAWURI="https://raw.github.com/$REPO/$BRANCH/"
GH_URI="https://github.com/$REPO.git"

install () {
  pacman -Sy $*;
}

cd ~

echo "Updating package manager."
sudo pacman -Ssy

echo "Installing git/wget/tmux."
install git
install wget
install tmux

echo "Cloning $GH_URI."
git clone $GH_URI
cd dotfiles;
git fetch origin
git checkout --track origin/$BRANCH

echo "Running bootstrap."
./setup.sh
