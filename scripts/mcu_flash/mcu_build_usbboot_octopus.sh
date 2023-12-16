#!/bin/bash
sudo systemctl stop klipper
sudo systemctl stop klipper-mcu

cd ~/CanBoot

cp ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.usbboot.octopus ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.usbboot.octopus.old
mv ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.usbboot.octopus ~/CanBoot
make clean KCONFIG_CONFIG=config.make.usbboot.octopus
make menuconfig KCONFIG_CONFIG=config.make.usbboot.octopus
make KCONFIG_CONFIG=config.make.usbboot.octopus
mv ~/CanBoot/config.make.usbboot.octopus ~/printer_data/config/scripts/mcu_flash/config/canboot/

sudo systemctl start klipper
sudo systemctl start klipper-mcu