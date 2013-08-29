#!/usr/bin/env bash

. lib/txt.sh
. lib/control.sh

NEW="awshost";

function GetFQDN () {
  echo "`hostname -f`";
}

function SetHostname () {
  Msg "Setting hostname to '$NEW'...";

  hostnamectl set-hostname "$NEW";
  echo "$NEW" > /etc/hostname

  Msg "Hostname set. Please re-log to see your changes.";
  Pause;
}

function Begin () {

  Msg "Hostname"
  Msg "================="
  NL;
  Msg "Currently: `GetFQDN`"
  NL;

  read -p "Enter your new hostname: " -e NEW;
  Confirmation "Is [$NEW] correct?" SetHostname;
}

function DidConfirm () {
  RequireRoot Begin AsRoot;
}

Confirmation "Do you want to change the hostname from `GetFQDN`?" DidConfirm
