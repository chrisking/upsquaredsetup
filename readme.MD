# Configuring the UP Squared IoT Development Kit:

Author: Chris King

Once installing the Intel wifi adapter the wireless tools and WPA support will need to be installed on the device in order to allow it to communicate via wifi.

### Installing The Wifi Packages:

After validating that the device has a valid internet connection via ethernet, enter the following commands:

```
sudo apt-get update
sudo apt-get install -y wpasupplicant wireless-tools
```

### Configuring Wifi:

First identify the wireless adapter name with:

```
sudo iwconfig
```

For the rest of this documentation and the scripts in this repository we will assume it is `wlp4s0`.

After those packages are installed you need to configure the connection to the wireless network. Please update the command below with your values then execute it on the device:

```
wpa_passphrase MYSSID MySecretPassphrase | grep -vE "{|#|}" | tr -d '\t' | sudo tee -a /etc/network/interfaces
```

Also 


All that remains is to reboot the device with:

```
sudo reboot
```

Remove the ethernet adapter and on boot the device should be fully connected to the wifi network.


### Scripts Library:

The shell scripts included in this library can be loaded onto external USB drives and placed in the device to automate this process.

The commands to mount and execute the scripts:

```
sudo mkdir /mnt/usb
sudo mount /dev/sda1 /mnt/usb
cd /mnt/usb
./setup.sh
```

Note that the `./setup.sh` assumes that you are executing that particular script, replace it with whatever script is needed.


1. Full Setup: `setup.sh` this file will ensure that all of the above steps are followed and the device is fully prepped. Before use ensure that you ahve updated the SSID and PASSCODE portions to be the values needed.
2. Just Packages: `package_setup.sh` will just install the wireless packages but not configure a network.
