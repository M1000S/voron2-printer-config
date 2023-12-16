#!/bin/bash
sudo systemctl stop klipper
sudo systemctl stop klipper-mcu

cd ~/klipper

cp ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.sb2240 ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.sb2240.old
mv ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.sb2240 ~/klipper
make clean KCONFIG_CONFIG=config.make.klipper.sb2240
make menuconfig KCONFIG_CONFIG=config.make.klipper.sb2240
make KCONFIG_CONFIG=config.make.klipper.sb2240
python3 ~/CanBoot/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u 79a866722924 
mv ~/klipper/config.make.klipper.sb2240 ~/printer_data/config/scripts/mcu_flash/config/klipper/

sudo systemctl start klipper
sudo systemctl start klipper-mcu
