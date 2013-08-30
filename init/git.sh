#!/usr/bin/env bash

. lib/txt.sh
. lib/control.sh

cfg="$HOME/.gitconfig"
Backup $cfg;

Msg "Symlinking new gitconfig."
ln -s `pwd`/link/gitconfig $cfg;

# Enable color in git
#echo "Configuring user info in git."
#git config --global --add color.ui true
#git config --global core.editor "vim"
#git config core.worktree `pwd`
#git config core.bare false
#git config receive.denycurrentbranch ignore

#inp " Enter your git name} " && git config --global user.name "$REPLY"
#inp "Enter your git email} " && git config --global user.email "$REPLY"

function AutoPush () {
  # Make it push on commit
  HOOK=".git/hooks/post-commit";
  HOOK2=".git/modules/vim/hooks/post-commit";

  cp copy/post-commit /tmp;
  lhook="/tmp/post-commit";
  
  if [ ! -z $1 ]; then
    GO="$1";

    Msg "|| Moved to '$1'.";
    pushd "$GO";
  fi;

  Msg "[Configuring git to auto-push to master on commit.]";
  cp $lhook $HOOK;
  cp $lhook $HOOK2;

  chmod +x $HOOK;
  chmod +x $HOOK2;

  git init;
  [ ! -z $GO ] && popd;

  Msg "Git configuration completed..";
}

echo `AutoPush .`;
echo `AutoPush ./link/vim`;

inp "Press enter." && echo "Done.";
