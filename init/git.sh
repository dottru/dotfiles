#!/usr/bin/env bash

. lib/txt.sh

GCFG="$HOME/.gitconfig"

# Link git config
if [[ -f $GCFG ]]; then
  Msg ".gitconfig moved to /tmp"
  mv $GCFG /tmp/;
fi;

Msg "Symlinking new gitconfig."
ln -s `pwd`/link/gitconfig $GCFG;

# Enable color in git
echo "Configuring user info in git."
git config --global --add color.ui true
git config --global core.editor "vim"

inp " Enter your git name} " && git config --global user.name "$REPLY"
inp "Enter your git email} " && git config --global user.email "$REPLY"

function AutoPush () {
  # Make it push on commit
  HOOK=".git/hooks/post-commit";
  lhook="copy/post-commit";
  
  if [ ! -z $1 ]; then
    GO="$1";
    Msg "Moved to '$1'.";
    cp $lhook /tmp;
    lhook="/tmp/post-commit";
    pushd "$GO";
  fi;

  echo "[Configuring git to auto-push to master on commit.]";
  cp $lhook $HOOK;
  chmod +x $HOOK
  git init
  [ ! -z $GO ] && popd;
  echo "Git configuration completed..";
}

echo `AutoPush .`;
inp "Press enter." && echo "Done.";
