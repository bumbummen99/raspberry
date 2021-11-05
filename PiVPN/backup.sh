#!/usr/bin/env bash

# Clean old backups
rm -f /home/pi/pivpnbackup/*

# Create a new backup
pivpn backup

# Upload it to OneDrive
rclone copy /home/pi/pivpnbackup/* OneDrive:PiBackups/PiVPN
