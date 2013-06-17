#!/usr/bin/env bash

. scripts/common.sh

# Assign identity
if [[ ! $1 ]]; then
	WHO=`whoami`;
else
	WHO=$1;
fi

if [[ $UID != "0" ]]; then	
	Section "Elevating to root.";
	sudo bash ./$0 $WHO
    exit 0
fi

Title "Configuring sudo permissions for $WHO.";

SF=/etc/sudoers
SCONT=`cat $SF`

if [[ $SCONT == *$WHO* ]]
then
	Print "'$WHO' already in sudoers"
else
	Print "Adding $WHO to sudoers"
fi
