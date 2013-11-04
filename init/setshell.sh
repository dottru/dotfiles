#!/usr/bin/env bash

. lib/txt.sh;
. lib/control.sh;

DEF='/bin/bash';
read -p "Choose your shell [${DEF}] :: " -e NEW;

if [ -z $NEW ]; then
    NEW=$DEF;
fi;

chsh -s $NEW;

Pause;
