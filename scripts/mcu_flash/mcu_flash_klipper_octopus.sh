#!/bin/bash
sudo systemctl stop klipper
sudo systemctl stop klipper-mcu

cd ~/klipper

cp ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.octopus ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.octopus.old
mv ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.octopus ~/klipper
make clean KCONFIG_CONFIG=config.make.klipper.octopus
make menuconfig KCONFIG_CONFIG=config.make.klipper.octopus
make KCONFIG_CONFIG=config.make.klipper.octopus
python3 ~/CanBoot/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u 707ec5b59d63 
mv ~/klipper/config.make.klipper.octopus ~/printer_data/config/scripts/mcu_flash/config/klipper/

sudo systemctl start klipper
sudo systemctl start klipper-mcu
