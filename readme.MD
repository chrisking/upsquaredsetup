# Configuring the UP Squared IoT Development Kit:

Author: Chris King

Once installing the Intel wifi adapter the wireless tools and WPA support will need to be installed on the device in order to allow it to communicate via wifi.

### Installing The Wifi Packages:

After validating that the device has a valid internet connection via ethernet, enter the following commands:

```
sudo apt-get install -y wpasupplicant wireless-tools
```

### Configuring Wifi:

First identify the wireless adapter name with:

```
sudo iwconfig
```

For the rest of this documentation and the scripts in this repository we will assume it is `wlp4s0`.

After those packages are installed and the wireless interface is known, add the following contnet to the the end of your `/etc/network/interfaces` file:

```
auto wlp4s0
iface wlp4s0 inet dhcp
    wpa-ssid SSID-HERE
    wpa-psk WPA-PASSCODE-HERE
```

Note the file will need to be edited as root so use the commands `sudo vim /etc/network/interfaces` or `sudo nano /etc/network/interfaces`.


All that remains is to reboot the device with:

```
sudo reboot
```

Remove the ethernet adapter and on boot the device should be fully connected to the wifi network.
