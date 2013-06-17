#!/usr/bin/env bash

# Enable color in git
echo "Enabling color in git..."
git config --global --add color.ui true

function inp() { read -r -p "$1"; }

inp "Enter your git name" && git config --global user.name $REPLY
inp "Enter your git email" && git config --global user.email $REPLY
