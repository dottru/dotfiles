#!/usr/bn/env bash

REPO=:"jmkogut/dotfiles"
BRANCH="master"
BOOTSTRAP="http_bs.sh"
SETUP="setup.sh"
RAWURI="https://raw.github.com/$REPO/$BRANCH/"
GH_URI="git://github.com/$REPO.git"

cd ~
sudo aptitude install git
git clone $GH_URI
cd dotfiles
./setup.sh
