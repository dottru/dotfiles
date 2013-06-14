#!/usr/bn/env bash

REPO=:"jmkogut/dotfiles"
BRANCH="master"
BOOTSTRAP="http_bs.sh"
SETUP="setup.sh"
RAWURI="https://raw.github.com/$REPO/$BRANCH/"
GH_URI="https://github.com/$REPO"

cd ~
git clone $GH_URI
cd dotfiles
./setup.sh
