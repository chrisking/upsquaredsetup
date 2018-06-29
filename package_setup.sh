#!/usr/bin/env bash
sudo apt-get update
# This remove command is done to undo any automatic updates that are turned on when the device is booted.
# Generally this is not a great idea.
sudo rm /var/lib/dpkg/lock

# These are the 2 core packages required to make wifi work with the UP Squared IoT Kit
sudo apt-get install -y wpasupplicant wireless-tools

