#!/usr/bn/env bash
 
# debug
# set -x
 
# --- Bootstrap methods
function SilentDL () {
    IN="${1}"; BN=`basename ${IN}`; OUT="${2:-$BN}";

    (rm -rf ${BN});
    (wget "${IN}" -O "${OUT}" >/dev/null 2>&1) # quiet wget
 
    export DL="`pwd`/${BN}"; # save file in $DL
}
 
function LoadLibs () {
    PFX=$1; LIBS=$2;
 
    echo "Entering [ ${WORKDIR} ].";
    pushd ${WORKDIR} > /dev/null;
 
    for lib in "${LIBS[@]}"; do
        URI="${PFX}/${lib}.sh";
        echo " -- loading [ ${URI} ].";
        SilentDL $URI > /dev/null;
    done;
 
    source "${DL}";
    popd > /dev/null;
 
    echo "Loaded (${#LIBS[@]}) files.";
}

function BranchPrompt () {
    read -p "Enter your choice [${1}] :: " -r;
    export BRANCH=${REPLY:-$1};
}
# ----
# ---- Load libraries, clone repo, open branch, run setup
# ----
 
clear; 
 
echo " ------------------------------------------------------- ";
echo "    Welcome to the dotfiles initialisation sequence.";
echo "    Which branch of this project would you like to use?";
echo "    Options: master (archlinux)";
echo "           : debfix (debian)";
echo "";

BranchPrompt "debfix";

echo -e "\nBranch [ ${BRANCH} ] selected.";

    
# Working variables, do not change.
USER="dottru"; REPO="dotfiles";
UNIQUEIDENT=$USER; 
 
  GH_URI="https://github.com/${USER}/${REPO}.git"
LIB_BASE="https://raw.github.com/${USER}/${REPO}/${BRANCH}/lib"; 
 
WORKDIR="/tmp/${USER}";
 
rm -rf $WORKDIR; mkdir $WORKDIR;
 
# --- Libraries
LIBS=( control globals txt );
LoadLibs $LIB_BASE $LIBS;
Msg "Libraries included. Initialising dotfiles."; NL;
 
 
# --- Cloning repo
Msg "Cloning dotfiles repo [ ${GH_URI} ]..."
 
Msg "  - rm -rf ./${REPO}";
rm -rf ${REPO} > /dev/null;
 
Msg "Cloning repo...";
(git clone $GH_URI > /dev/null 2>&1);
 
Msg "  -- cd ./${REPO}";
cd $REPO;
NL;
 
# --- Checkout branch if not master
NL; Msg "Loading branch [ ${BRANCH} ].";
git checkout -b $BRANCH origin/$BRANCH
NL;
 
# --- Executing setup
 
read -p "[Enter to run setup...]";
/usr/bin/env bash ./setup.sh
