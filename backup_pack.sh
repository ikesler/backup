#!/bin/bash
set -e

# Load env variables from .env file
export $(grep -v '^#' .env | xargs)

backup_name="$1"

source_dir="/var/tmp/backup/$backup_name/create"
target_dir="/var/tmp/backup/$backup_name/pack"
mkdir -p "$target_dir"

cd "$source_dir"

timeout 300s tar -czhf "$target_dir/backup.tar.gz" .

timeout 300s gpg --batch --yes --passphrase-file "$BACKUP_ENCRYPTION_KEY_FILE" -c "$target_dir/backup.tar.gz"

cd "$target_dir"

timeout 300s split -b 100m backup.tar.gz.gpg backup.tar.gz.gpg.

rm backup.tar.gz
rm backup.tar.gz.gpg
