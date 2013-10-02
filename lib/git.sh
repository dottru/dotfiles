#!/usr/bin/env bash

. lib/txt.sh

function SetRemote () {
    USER="${1}";
    REPO="${2}";
    uri="git@github.com:$USER/$REPO.git";


    Msg "Setting remote uri of `pwd`";
    Msg " -> $uri";

    git remote set-url origin $uri;
}

SetRemote "dottru" "dotfiles";
