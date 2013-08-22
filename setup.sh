#!/usr/bin/env bash

# TODO: auto-update ctags
#     : auto-gen .srclist for new users


. scripts/common.sh
. scripts/steps.sh

Main;

# Set hostname
. scripts/hostname.sh

# Create new user account
. scripts/add_user.sh

msg "Setup complete.";
Pause;

