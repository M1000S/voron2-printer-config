#!/bin/bash
sudo systemctl stop klipper
sudo systemctl stop klipper-mcu

cd ~/CanBoot

cp ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.canboot.mmb ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.canboot.mmb.old
mv ~/printer_data/config/scripts/mcu_flash/config/canboot/config.make.canboot.mmb ~/CanBoot
make clean KCONFIG_CONFIG=config.make.canboot.mmb
make menuconfig KCONFIG_CONFIG=config.make.canboot.mmb
make KCONFIG_CONFIG=config.make.canboot.mmb
mv ~/CanBoot/config.make.canboot.mmb ~/printer_data/config/scripts/mcu_flash/config/canboot/

sudo systemctl start klipper
sudo systemctl start klipper-mcu