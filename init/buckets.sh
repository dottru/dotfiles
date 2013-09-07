#!/usr/bin/env bash

. lib/txt.sh
. lib/control.sh
. init/pkgman.sh

function Install () {
  PkgInstall s3cmd
  PkgInstall gnupg

  Msg "Installed s3cmd and gnupg."
}

function Setup () {
  Confirmation "Install s3cmd and gpg?" Install;

  Msg "S3CMD is about to ask you for credentials."
  Msg "If you need to decrypt some, hit up `init/s3-creds.sh`"

  Pause;

  s3cmd --configure
}
