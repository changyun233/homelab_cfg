#!/bin/bash

DEVICE="/dev/cdc-wdm0"
APN="cmnet"
WWAN="wwan0"

ip link set $WWAN down
echo 'Y' | tee /sys/class/net/wwan0/qmi/raw_ip

echo "Starting WWAN connection..."
qmicli -d $DEVICE --wds-start-network="apn='$APN',ip-type=4" --client-no-release-cid


sleep 3

echo "Setting wwan0 UP..."
ip link set wwan0 up

sleep 3

echo "Obtaining IP address for wwan0..."
udhcpc -i wwan0
