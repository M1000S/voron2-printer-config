#!/bin/sh
sudo systemctl stop klipper-mcu
sleep 5s
sudo systemctl stop klipper



cd ~/klipper

if [ "$1" = "-v" ]; then
    echo "verbose"
else
    echo "menuconfig"
fi


#sudo systemctl start klipper
#sudo systemctl start klipper-mcu