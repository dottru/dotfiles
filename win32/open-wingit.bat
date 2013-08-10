@echo off
echo "Download and install windows git from the following page."
echo "Press enter to load page."
echo ""
echo "At one point it will ask you to pick one of three choices for
echo  shell integration. Choose the third, 'git with unix utilities.'"

pause

echo
echo
echo The page will now open.
start http://msysgit.github.io/

echo
echo "Please download and install git for windows before pressing enter."
pause

echo We will now c;lone the github devsetup uri for windows. Make sure you ran this bat file
echo from __MY_DOCUMENTS__.
echo

@echo on
git clone https://github.com/jmkogut/dotfiles.git 