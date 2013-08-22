#!/usr/bin/env bash

. scripts/common.sh

NEW="awshost";

function SetHostname () {
  msg "Setting hostname to '$NEW'...";
  hostnamectl set-hostname "$NEW";
  msg "Hostname set. Please re-log to see your changes.";
  Pause;

  exit 0;
}

function Begin () {

  msg "Hostname"
  msg "================="
  NL;
  msg "Currently: `cat /etc/hostname`"
  NL;

  read -p "Enter your new hostname: " -e NEW;
  Confirmation "Is [$NEW] correct?" SetHostname;
}

function DidConfirm () {
  RequireRoot Begin AsRoot;
}

Confirmation "Do you want to change the hostname from ${GetFQDN}?" DidConfirm
