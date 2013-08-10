CWD="$HOME"
REPO="https://github.com/jmkogut/dotfiles.git"

msg   () { read -p "[Enter] $*..."; }
pause () { msg "to continue"; }

echo "PWD appears to be $CWD. If this is wrong, close this and edit the line that sets CWD."
echo "Recommended inst. path is identical %userprofile% on most win32 systems."

pause

echo "CD $CWD"
cd $CWD

echo "rm ./dotfiles"
rm -rf ./dotfiles

echo "git clone $REPO -> $CWD/dotfiles"
git clone $REPO

msg "to initialise environment setup."

NDIR="./dotfiles/win32"
echo "cd $NDIR"
cd $NDIR;