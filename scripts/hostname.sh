#!/usr/bin/env bash

clear;

. scripts/common.sh
set -e; # set -x; # debugging

NEW="awshost"

function SetHostname () {
  msg "Setting hostname to '$NEW'..."
  hostnamectl set-hostname "$NEW" msg "Hostname set. Please re-log to see your changes."
  Pause;
  exit 0;
}

function Begin () {
  read -p "Enter your new hostname: " -e NEW
  Confirmation "Is [$NEW] correct?" SetHostname
}
function AsRoot () { msg "Elevating user privileges..."
  sudo bash $0;
}

RequireRoot Begin AsRoot
