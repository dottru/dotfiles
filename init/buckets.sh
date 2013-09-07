#!/bin/bash

. lib/txt.sh
. lib/control.sh

clear;

BUCK=thechex
MNT=/mnt/thchex;

Section "Mounting S3 Bucket";

if [ -d $MNT ]; then
  Msg "Re-mounting [${BUCK}]";
  umount $MNT;
else
  Msg "Creating [${MNT}]";
  mkdir $MNT;
fi;

Msg "Mounting ${BUCK} to [${MNT}]";
s3fs $BUCK $MNT;
