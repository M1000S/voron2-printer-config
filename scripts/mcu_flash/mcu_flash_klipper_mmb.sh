#!/bin/bash
sudo systemctl stop klipper
sudo systemctl stop klipper-mcu

cd ~/klipper

cp ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.mmb ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.mmb.old
mv ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.mmb ~/klipper
make clean KCONFIG_CONFIG=config.make.klipper.mmb
make menuconfig KCONFIG_CONFIG=config.make.klipper.mmb
make KCONFIG_CONFIG=config.make.klipper.mmb
python3 ~/CanBoot/scripts/flashtool.py -i can0 -f ~/klipper/out/klipper.bin -u 145c39b4b931 
mv ~/klipper/config.make.klipper.mmb ~/printer_data/config/scripts/mcu_flash/config/klipper/

sudo systemctl start klipper
sudo systemctl start klipper-mcu
