#!/usr/bin/env bash

# Remove old backups
rm -f $OPENHAB_BACKUPS/*

# Create a backup
$OPENHAB_HOME/runtime/bin/backup

# Upload new backup
rclone copy $OPENHAB_BACKUPS/* OneDrive:PiBackups/OpenHab
