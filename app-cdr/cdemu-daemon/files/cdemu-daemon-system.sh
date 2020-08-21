#!/bin/sh
# Starts the CDEmu daemon instance on D-Bus *system* bus. Optional
# configuration (number of devices, audio driver, log file) are read
# from /etc/conf.d/cdemu-daemon

# Default settings
NUM_DEVICES=1
AUDIO_DRIVER=null
LOG_FILE=/var/log/cdemu-daemon.log

# Read the settings
CONFIG_FILE=/etc/conf.d/cdemu-daemon

if [ -f ${CONFIG_FILE} ]; then
    . ${CONFIG_FILE};
fi

# Start the daemon
exec cdemu-daemon --ctl-device=/dev/vhba_ctl --bus=system --num-devices=${NUM_DEVICES} --audio-driver=${AUDIO_DRIVER} --logfile=${LOG_FILE}
