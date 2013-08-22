#!/usr/bin/env bash

. scripts/common.sh

function MountBucket () {
  BUCKET=$1;
  modprobe fuse;
  
  Section "Mounting S3 bucket '$BUCKET'"
  msg "[[ as user `whoami` ]]"

  MNT=$HOME/s3/$BUCKET;
  OPTS="-o allow_other -o use_cache=/tmp"
  # use -o default_acl=public-read-write for public

  msg "[checking for $MNT]"

  if [[ -d $MNT ]]; then
    msg "Mount point already exists. Deleting."
    umount $MNT;
    Remove $MNT;
    Pause;
  fi;

  mkdir -p $MNT;
  s3fs $BUCKET $MNT $OPTS;

  msg "Bucket mounted."
  Pause;
}

function MountChex () {
  Section "Mounting bucket 'thechex'."
  MountBucket thechex;
}

function DecryptKey () {
  if [[ ! -e $HOME/dotfiles/passwd-s3fs ]]; then
    msg "Keyfile doesn't exist. Decrypting."
    Decrypt $HOME/dotfiles/passwd-s3fs.crypt;
  else
    msg "Keyfile exists. No need to decrypt."
  fi;
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

# Install s3fs as root
bash ./scripts/install-s3fs.sh

# Configure userspae shizzit
Section "Userspace S3FS config"

DecryptKey;

# S3 key copy / mount
ConfigS3FS;
