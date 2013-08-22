#!/usr/bin/env bash

. scripts/common.sh

function InstallS3FS () {
  Section "Amazon S3FS fuse installation"

  msg "Installing yaourt and aur/s3fs"
  Install yaourt
  sudo yaourt aur/s3fs

  msg "S3FS has been successfully installed."
}

function ConfirmInstall () {
  RequireRoot InstallS3FS AsRoot
}

SCRIPT=$0; # Needed for AsRoot
Confirmation "Install s3fs? " ConfirmInstall
