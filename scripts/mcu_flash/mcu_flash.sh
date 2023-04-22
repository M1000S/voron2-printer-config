#!/bin/bash
sudo systemctl stop klipper
sudo systemctl stop klipper-mcu
cd ~/klipper
#git pull

#make clean KCONFIG_CONFIG=config.spider
#make menuconfig KCONFIG_CONFIG=config.spider
#make KCONFIG_CONFIG=config.spider
#./scripts/flash-sdcard.sh /dev/ttyAMA0 fysetc-spider-v1

make clean KCONFIG_CONFIG=config.rpi
#make menuconfig KCONFIG_CONFIG=config.rpi
make KCONFIG_CONFIG=config.rpi
sudo /home/pi/klipper/scripts/flash-linux.sh 

sudo systemctl start klipper
sudo systemctl start klipper-mcu
