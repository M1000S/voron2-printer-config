#!/bin/bash
sudo systemctl stop klipper
sudo systemctl stop klipper-mcu

cd ~/klipper

if [ "$1" = "-v" ]; then
    cp ~/printer_data/config/scripts/mcu_flash/config.make.klipper.rpi ~/klipper
    make clean KCONFIG_CONFIG=config.make.klipper.rpi
    make KCONFIG_CONFIG=config.make.klipper.rpi
    sudo /home/pi/klipper/scripts/flash-linux.sh 
    rm ~/klipper/config.make.klipper.rpi
else
    cp ~/printer_data/config/scripts/mcu_flash/config.make.klipper.rpi ~/printer_data/config/scripts/mcu_flash/config.make.klipper.rpi.old
    mv ~/printer_data/config/scripts/mcu_flash/config.make.klipper.rpi ~/klipper
    make clean KCONFIG_CONFIG=config.make.klipper.rpi
    make menuconfig KCONFIG_CONFIG=config.make.klipper.rpi
    make KCONFIG_CONFIG=config.make.klipper.rpi
    sudo /home/pi/klipper/scripts/flash-linux.sh 
    mv ~/klipper/config.make.klipper.rpi ~/printer_data/config/scripts/mcu_flash
fi


sudo systemctl start klipper
sudo systemctl start klipper-mcu