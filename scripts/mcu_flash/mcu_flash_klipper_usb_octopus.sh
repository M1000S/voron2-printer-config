#!/bin/bash
sudo systemctl stop klipper
sudo systemctl stop klipper-mcu

cd ~/klipper

cp ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.usboctopus ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.usboctopus.old
mv ~/printer_data/config/scripts/mcu_flash/config/klipper/config.make.klipper.usboctopus ~/klipper
make clean KCONFIG_CONFIG=config.make.klipper.usboctopus
make menuconfig KCONFIG_CONFIG=config.make.klipper.usboctopus
make KCONFIG_CONFIG=config.make.klipper.usboctopus
python3 ~/CanBoot/scripts/flashtool.py -f ~/klipper/out/klipper.bin -d /dev/serial/by-path/platform-fd500000.pcie-pci-0000:01:00.0-usb-0:1.1:1.0
mv ~/klipper/config.make.klipper.usboctopus ~/printer_data/config/scripts/mcu_flash/config/klipper/

sudo systemctl start klipper
sudo systemctl start klipper-mcu
