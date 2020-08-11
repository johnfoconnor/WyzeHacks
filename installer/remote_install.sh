#!/bin/sh
cd $(dirname $0)

cp ./FIRMWARE_660R.bin ./firmware.bin

if [ -f config.inc ]; then
    echo "Found local config file, including into firmware update archive..."
    mkdir ./Upgrade
    cp config.inc ./Upgrade
    tar -rvf ./firmware.bin Upgrade/config.inc
fi

python3 ./wyze_updater.py update \
    -m WYZEC1-JZ -m WYZECP1_JEF -f ./firmware.bin -p 11808