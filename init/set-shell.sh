#!/usr/bin/env bash

. lib/txt.sh
. lib/control.sh

Section "Shell ||";

function SetShell () {
    chsh;
};

Confirmation "Do you want to set your shell?" SetShell;
