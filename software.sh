#!/usr/bin/env bash

sep="=========="

# Module defs
install () { echo "Installing $@..."; sudo aptitude -y install $@; }
section () { echo -e "$sep\n$@\n$sep" }


section "Shell customisations"
install fish
echo "Default shell changed to 'fish' shell. Reset to bash with [ chsh -s `whereis bash` ]"
chsh -s /usr/bin/fish

section	"EC2 Tools"
install java7-jdk
install ec2-api-tools
cat ./ec2_vars.sh >> ~/.bashrc # bashrc conf

echo "All done installing."
