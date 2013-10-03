#!/usr/bin/env bash

export DFDEBUG=1;

export DOTFILES=$(pwd);
#export GIT_DIR=$(pwd);

function GetScriptDir () {
	SCRIPT_PATH="${BASH_SOURCE[0]}";
	if ([ -h "${SCRIPT_PATH}" ]) then
	  while([ -h "${SCRIPT_PATH}" ]) do SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
	fi
	pushd . > /dev/null
	cd `dirname ${SCRIPT_PATH}` > /dev/null
	SCRIPT_PATH=`pwd`;
	popd  > /dev/null
	echo $SCRIPT_PATH;
};
