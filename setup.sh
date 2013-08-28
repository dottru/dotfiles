#!/usr/bin/env bash

# TODO: auto-update ctags
#     : auto-gen .srclist for new users

clear;

. scripts/common.sh
. scripts/steps.sh

Main;

# Set hostname
. scripts/hostname.sh

# Create new user account
. scripts/add_user.sh

# Mount S3 bucket
. scripts/s3-bucket.sh

# Generate / export ssh keys
 . scripts/ssh-keys.sh

msg "Setup complete.";
Pause;
