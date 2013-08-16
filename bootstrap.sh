#!/usr/bn/env bash

REPO="jmkogut/dotfiles"
BRANCH="master"
BOOTSTRAP="http_bs.sh"
SETUP="setup.sh"
RAWURI="https://raw.github.com/$REPO/$BRANCH/"
GH_URI="https://github.com/$REPO.git"

cd ~

echo "Installing git."
sudo pacman -S git

echo "Cloning $GH_URI."
git clone $GH_URI

echo "Running bootstrap."
cd dotfiles
./setup.sh
