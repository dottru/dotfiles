#!/usr/bin/env bash

. lib/txt.sh
. init/pkgman.sh

Section "Torrenting packages."

PkgInstall transmission-cli 
PkgInstall transmission-remote-cli 

## Transmission
CONF="/var/lib/transmission/.config/transmission-daemon/settings.json";

# Trans writes the config on close. Gotta cycle it once first.
systemctl start transmission
systemctl stop  transmission

Msg "Copying over transmission config.";

cp "copy/transmission.json" "$CONF";
Msg "Transmission has been configured but has been left off.";
Msg "[[ systemctl start transmission ]]";
