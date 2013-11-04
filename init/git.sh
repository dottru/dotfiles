#!/usr/bin/env bash

clear;

. lib/txt.sh
. lib/control.sh

# Git push behaviour
git config push.default current

# symlink git config
Msg "Symlinking new gitconfig.";
LinkBack "`pwd`/link/gitconfig" "$HOME/.gitconfig";


function AutoPush () {
  Msg "Enabling auto-push for `pwd`";
    
  # vars
  WDIR="${1}"; TMP="/tmp"; PC="post-commit";
  TPC="${TMP}/${PC}";

  GITROOT=".git"; VIMROOT="${GITROOT}/modules/vim";
  pchook="/hooks/post-commit";

  GH="${GITROOT}/${pchook}";
  VH="${VIMROOT}/${pchook}";
  
  # -- do work
  cp copy/${PC} ${TPC};

  # echo expanded path
  Msg "|| CD -> $(ExpandPath $WDIR).";
  pushd "$WDIR" > /dev/null;

  Msg "[Configuring git to auto-push to master on commit.]";
  cp $TPC $GH;
  cp $TPC $VH;

  chmod +x $GH;
  chmod +x $VH;

  Msg "Copied post commit hooks. Initialising git.";
  git init;
  popd > /dev/null;

  Msg "Git configuration completed..";
}

function EnableAutoPush () {
    AutoPush ".";
}

function CreateGitCFG () {
    return 1;
    # Enable color in git
    #echo "Configuring user info in git."
    #git config --global --add color.ui true
    #git config --global core.editor "vim"
    #git config core.worktree `pwd`
    #git config core.bare false
    #git config receive.denycurrentbranch ignore

    #inp " Enter your git name} " && git config --global user.name "$REPLY"
    #inp "Enter your git email} " && git config --global user.email "$REPLY"
}

Confirmation "Configure git to auto-push on commit?" EnableAutoPush;
