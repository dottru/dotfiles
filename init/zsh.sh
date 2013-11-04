#!/usr/bin/env bash

. lib/txt.sh;
. lib/control.sh;

Msg "Make sure you have ZSH installed."; Pause;
chsh -s /bin/zsh

pretzo="https://github.com/sorin-ionescu/prezto.git";

Msg "Cloning ZSH configuration framework [[ Pretzo ]]";
git clone --recursive $pretzo $HOME/.zpretzo


