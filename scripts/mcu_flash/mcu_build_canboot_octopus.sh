#!/bin/bash
sudo systemctl stop klipper
sudo systemctl stop klipper-mcu

cd ~/CanBoot

cp ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.canboot.octopus ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.canboot.octopus.old
mv ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.canboot.octopus ~/CanBoot
make clean KCONFIG_CONFIG=config.make.canboot.octopus
make menuconfig KCONFIG_CONFIG=config.make.canboot.octopus
make KCONFIG_CONFIG=config.make.canboot.octopus
mv ~/CanBoot/config.make.canboot.octopus ~/printer_data/config/scripts/mcu_flash/config/canboot/

sudo systemctl start klipper
sudo systemctl start klipper-mcu