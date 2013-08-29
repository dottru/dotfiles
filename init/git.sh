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

inp " Enter your git name} " && git config --global user.name "$REPLY"
inp "Enter your git email} " && git config --global user.email "$REPLY"

# Make it push on commit
HOOK=".git/hooks/post-commit";

echo "[Configuring git to auto-push to master on commit.]";
echo -e '#!/usr/bin/env bash\r\ngit push origin master' > $HOOK;
chmod +x $HOOK

echo "Git configuration completed..";
inp "Press enter." && echo "Done.";
