#!/bin/bash
sudo systemctl stop klipper
sudo systemctl stop klipper-mcu

cd ~/CanBoot

cp ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.canboot.sb2240 ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.canboot.sb2240.old
mv ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.canboot.sb2240 ~/CanBoot
make clean KCONFIG_CONFIG=config.make.canboot.sb2240
make menuconfig KCONFIG_CONFIG=config.make.canboot.sb2240
make KCONFIG_CONFIG=config.make.canboot.sb2240
mv ~/CanBoot/config.make.canboot.sb2240 ~/printer_data/config/scripts/mcu_flash/config/canboot/

sudo systemctl start klipper
sudo systemctl start klipper-mcu