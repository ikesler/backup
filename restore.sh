#!/bin/bash

set -e

# Load env variables from .env file
export $(grep -v '^#' .env | xargs)

backup_directory="$1"

mkdir -p "$backup_directory/restore"

cat "$backup_directory/backup.tar.gz.gpg.??" > "$backup_directory/backup.tar.gz.gpg"
gpg --decrypt --passphrase "$BACKUP_ENCRYPTION_KEY" "$backup_directory/backup.tar.gz.gpg" > "$backup_directory/backup.tar.gz"
tar -xzf "$backup_directory/backup.tar.gz" -C "$backup_directory/restore"
