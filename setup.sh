#!/usr/bin/env bash
sudo apt-get update
# This remove command is done to undo any automatic updates that are turned on when the device is booted.
# Generally this is not a great idea.
sudo rm /var/lib/dpkg/lock

# These are the 2 core packages required to make wifi work with the UP Squared IoT Kit
sudo apt-get install -y wpasupplicant wireless-tools

# Execute this to get the name of the wireless interface. Generally it is "wlp4s0"
sudo iwconfig

# The following sets up the wireless network for the device
sudo echo "auto wlp4s0" >> /etc/network/interfaces
sudo echo "iface wlp4s0 inet dhcp" >> /etc/network/interfaces
sudo echo "        wpa-ssid SSID-HERE" >> /etc/network/interfaces
sudo echo "        wpa-psk WPA-PASSCODE-HERE" >> /etc/network/interfaces

# Finally reboot the device and it should automatically be connected to the wifi network.
sudo reboot
