#!/usr/bin/env bash

function MatchCase () {
	if [[ $1 -eq 0 ]]; then
		shopt -s nocasematch;
	elif [[ $1 -eq 1 ]]; then
		shopt -u nocasematch;
	fi;
}
