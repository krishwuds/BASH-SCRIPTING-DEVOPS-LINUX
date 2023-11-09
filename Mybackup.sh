#!/bin/bash

# Source directory and backup directory
source_dir="/home/ubuntu/my-web"
backup_dir="/home/ubuntu/backup"

# Creating timestamp for the backup folder name
timestamp=$(date +%Y%m%d%H%M%S)

backup_folder="$backup_dir/backup_$timestamp"
mkdir -p "$backup_folder"

if [ $? -eq 0 ]; then
  echo "Backup folder '$backup_folder' created successfully."

  backup_file="$backup_folder/backup_$timestamp.tar.gz"  # Specify a filename for the backup

  tar czf "$backup_file" --absolute-names "$source_dir"

  if [ $? -eq 0 ]; then
    echo "Backup completed successfully and saved in $backup_file"
  else
    echo "Backup failed."
  fi
else
  echo "Failed to create backup folder."
fi
