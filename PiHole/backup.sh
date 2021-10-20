#!/usr/bin/env bash

# Clean old backups
rm -f ~/backups/*

# Create a new backup
cd ~/backups
pihole -a -t

# Upload it to OneDrive
rclone copy ~/backups/* OneDrive:PiBackups/PiHole
