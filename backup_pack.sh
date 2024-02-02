#!/bin/bash
set -e

backup_name="$1"

source_dir="/v/backup/$backup_name/create"
target_dir="/v/backup/$backup_name/pack"

cd "$source_dir"

tar -czf "$target_dir/backup.tar.gz" .

gpg --batch --yes --passphrase "$BACKUP_ENCRYPTION_KEY" -c "$target_dir/backup.tar.gz"

cd "$target_dir"

split -b 100m backup.tar.gz.gpg backup.tar.gz.gpg.

rm backup.tar.gz.gpg
