#!/usr/bn/env bash

REPO="jmkogut/dotfiles"
BRANCH="master"
BOOTSTRAP="http_bs.sh"
SETUP="setup.sh"
RAWURI="https://raw.github.com/$REPO/$BRANCH/"
GH_URI="https://github.com/$REPO.git"

install () {
  pacman -Sy $*;
}

cd ~

echo "Installing pre-reqs."
install git
install wget
install tmux

echo "Cloning $GH_URI."
git clone $GH_URI

echo "Running bootstrap."
cd dotfiles
./setup.sh
