#!/usr/bin/env bash

# Link git config
ln -s `pwd`/link/gitconfig ~/.gitconfig

# Enable color in git
echo "Configuring user info in git."
git config --global --add color.ui true

function inp() { read -r -p "$1"; }

inp " Enter your git name} " && git config --global user.name $REPLY
inp "Enter your git email} " && git config --global user.email $REPLY

# Make it push on commit
echo "[Configuring git to auto-push to master on commit.]";
HOOK=".git/hooks/post-commit";
echo -e '#!/usr/bin/env bash\r\ngit push origin master' > $HOOK;

echo "Done.";
inp "Press enter." && echo "Done.";
