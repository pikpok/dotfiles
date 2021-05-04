#!/bin/sh
# Disable fingerprint reader and webcam on lid close
# Based on https://jim-think.blogspot.com/2020/10/disable-fingerprint-scanner-when-laptop.html

grep -q close /proc/acpi/button/lid/LID/state
if [ $? = 0 ]; then
    echo 0 > /sys/bus/usb/devices/5-3/authorized
    echo 0 > /sys/bus/usb/devices/1-2/authorized
fi

grep -q open /proc/acpi/button/lid/LID/state
if [ $? = 0 ]; then
    echo 1 > /sys/bus/usb/devices/5-3/authorized
    echo 1 > /sys/bus/usb/devices/1-2/authorized
fi

exit 0
