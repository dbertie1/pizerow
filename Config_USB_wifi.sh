#! /bin/bash
sudo apt update
sudo apt full-upgrade
sudo apt install -y build-essential git dkms raspberrypi-kernel-headers
git clone https://github.com/kelebek333/rtl8188fu
sudo dkms add ./rtl8188fu
sudo dkms build rtl8188fu/1.0
sudo dkms install rtl8188fu/1.0
sudo cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/
echo "options rtl8188fu rtw_power_mgnt=0" | sudo tee /etc/modprobe.d/rtl8188fu.conf
sudo reboot now