#!/usr/bin/env bash

. lib/txt.sh
. lib/control.sh

Section "Building S3FS";

cd /tmp;
git clone https://github.com/tongwang/s3fs-c.git
cd s3fs-c/;
Msg "Installing pre-reqs"
aptitude install fuse libcurl-dev libxml2-dev libcrypto++9
./configure
make
make install
