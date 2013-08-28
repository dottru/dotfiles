#!/usr/bn/env bash

REPO="dottru/dotfiles"
RAWURI="https://raw.github.com/$REPO/$BRANCH/"
GH_URI="https://github.com/$REPO.git"


echo "Cloning $GH_URI."
git clone $GH_URI
cd dotfiles;
git fetch origin $BRANCH;
git checkout $BRANCH;

read -p "[Enter to run setup...]";

echo "Running bootstrap."
./$SETUP
