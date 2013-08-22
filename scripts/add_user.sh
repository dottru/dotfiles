#!/usr/bin/env bash

. scripts/common.sh

# Helper method for adding a name to sudoers
function addToSudo () {
  # Adds a user or group to /etc/sudoers
  TMP="/etc/sudoers.tmp.auto";
  ORI="/etc/sudoers";

  msg "Adding $1 to sudoers.";
  msg "---------------------";

  LINE="%$GROUP    ALL=NOPASSWD: ALL";

  if [ -f $TMP ]; then
      msg "!!! SUDOERS IN USE !!!";
      Pause;
  else
    cp $ORI $TMP;
    echo $LINE >> $TMP;
    visudo -c -f $TMP;

    # $? = most recent pipeline foreground exist status
    if [ "$?" -eq "0" ]; then
        msg "$GROUP added to sudoers!~"
        cp $TMP $ORI;
    else # TODO: log failure 
        msg "Sudoer file modifications failed."
        Pause;
    fi;

    rm -rf $TMP;
  fi;
}

USERNAME="";

function CreateUser () {
  GROUP="admin";
  SEARCH=`egrep -i "^$GROUP" /etc/group`

  if [[ -n $SEARCH ]]; then
    msg "Group '$GROUP' already exists...";
  else
    # Create admins
    msg "Adding custom admin group.";
    groupadd $GROUP;
  fi;

  # Create user
  # m = create home, g = def group
  msg "Creating user account.";
  useradd -m -g $GROUP $USERNAME;

  addToSudo "$GROUP";

  Pause;
}

function UserSetup () {
  msg "Setting up user for you.";

  read -p "Enter username for new account: " -e USERNAME
  Confirmation "Is [$USERNAME] correct?" CreateUser
}

function AsRoot () {
  msg "Elevating user privileges..."
  sudo bash $0;
}

function Confirmed () {
  RequireRoot UserSetup AsRoot;
}

Confirmation "Do you want to setup a new user account? " Confirmed
