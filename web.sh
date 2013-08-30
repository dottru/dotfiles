#!/usr/bn/env bash

. lib/globals.sh

REPO="dottru/dotfiles"
RAWURI="https://raw.github.com/$REPO/$BRANCH/"
GH_URI="https://github.com/$REPO.git"

echo "Cloning $GH_URI."
git clone $GH_URI
cd dotfiles;

read -p "[Enter to run setup...]";
./setup.sh
