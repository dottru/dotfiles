#!/usr/bn/env bash

REPO=:"jmkogut/dotfiles"
BRANCH="master"
BOOTSTRAP="http_bs.sh"
SETUP="setup.sh"
RAWURI="https://raw.github.com/$REPO/$BRANCH/"
GH_URI="git://github.com/$REPO.git"

cd ~

echo "Installing git."
sudo aptitude install -y git

echo "Cloning $GH_URI."
git clone $GH_URI

echo "Running bootstrap."
cd dotfiles
./setup.sh
