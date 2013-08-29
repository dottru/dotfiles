#!/usr/bin/env bash

. lib/txt.sh
. lib/control.sh 

  function isGroup () {
    RES=$(egrep -i "^$1" /etc/group)
    if [[ $? == 0 ]]; then
      echo "a valid group"
      return 0; # zero is success
    else 
      echo "not a group"
      return 1; # fail
    fi;
  }

# Helper method for adding a name to sudoers
function addToSudo () {
  # Adds a user or group to /etc/sudoers
  TMP="/etc/sudoers.tmp.auto";
  ORI="/etc/sudoers";

  Msg "Adding $1 to sudoers.";
  Msg "---------------------";

  LINE="%$GROUP    ALL=NOPASSWD: ALL";

  if [[ -f $TMP ]]; then
      Msg "!!! SUDOERS IN USE !!!";
      Pause;
  else
    cp $ORI $TMP;
    echo $LINE >> $TMP;
    visudo -c -f $TMP;

    # $? = most recent pipeline foreground exist status
    if [ "$?" -eq "0" ]; then
        Msg "$GROUP added to sudoers!~"
        cp $TMP $ORI;
    else # TODO: log failure 
        Msg "Sudoer file modifications failed."
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
    Msg "Group '$GROUP' already exists...";
  else
    # Create admins
    Msg "Adding custom admin group.";
    groupadd $GROUP;
  fi;

  # Create user
  # m = create home, g = def group
  Msg "Creating user account.";
  useradd -m -g $GROUP $USERNAME;

  addToSudo "$GROUP";

  Pause;
}

function UserSetup () {
  Msg "Setting up user for you.";

  read -p "Enter username for new account: " -e USERNAME
  Confirmation "Is [$USERNAME] correct?" CreateUser
}

function AsRoot () {
  Msg "Elevating user privileges..."
  sudo bash $0;
}

function Confirmed () {
  RequireRoot UserSetup AsRoot;
}

Confirmation "Do you want to setup a new user account? " Confirmed
