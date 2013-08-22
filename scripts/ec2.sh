#!/usr/bin/env bash

. scripts/common.sh

function MountBucket () {
  BUCKET=$1;
  modprobe fuse;
  
  Section "Mounting S3 bucket '$BUCKET'"

  MNT=$HOME/s3/$BUCKET;
  OPTS="-o allow_other -o use_cache=/tmp"
  # use -o default_acl=public-read-write for public

  msg "[checking for $MNT]"
  if [[ -d $MNT ]]; then
    msg "Mount point already exists. Deleting."
    Remove $MNT;
    Pause;
  fi;

  mkdir -p $MNT;
  s3fs $OPTS $BUCKET $MNT;
}

function MountChex () {
  Section "Mounting bucket 'thechex'."
  MountBucket thechex;
}

function ConfigS3FS () {
  Section "S3FS configuration"
  msg "Copying aws access keys for the bucket."
  
  CFG=passwd-s3fs
  DF=$HOME/dotfiles/$CFG
  S3=$HOME/.$CFG

  RemoveIfExists $S3;

  cp $DF $S3;

  chmod 0600 $S3;

  msg "S3fs keys copied."

  Confirmation "Mount thechex bucket? " MountChex
}

bash ./scripts/install-s3fs.sh

Section "Userspace S3FS config"
ConfigS3FS;
