#!/bin/sh

# Use the Fn-F2 combination to disable/enable wireless on Asus K52

WLANSTATUS=`cat /sys/class/ieee80211/phy0/rfkill*/state`

test -z $WLANSTATUS && exit 1

if [ $WLANSTATUS = 0 ]; then
	echo 0 > /sys/devices/platform/asus_laptop/wlan
	echo 1 > /sys/class/ieee80211/phy0/rfkill*/state
elif [ $WLANSTATUS = 1 ]; then
	echo 1 > /sys/devices/platform/asus_laptop/wlan
	echo 0 > /sys/class/ieee80211/phy0/rfkill*/state
fi
