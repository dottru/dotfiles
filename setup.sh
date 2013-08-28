#!/usr/bin/env bash

echo "Installing a few required packages first.";

. init/pkgman.sh
. init/packages.sh

echo "Placing dotfies where they need to go.";

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
