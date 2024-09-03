#!/bin/bash

set -e

# Load env variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

backup_name="$1"
backup_directory="./$backup_name"

if [ -d "$backup_directory" ]; then
    rm -r "$backup_directory"
fi

aws s3 cp "s3://$BACKUP_S3_BUCKET/$backup_name" "$backup_directory"  --recursive --profile backup --endpoint-url "$BACKUP_S3_ENDPOINT"

mkdir -p "$backup_directory/restore"

cat ${backup_directory}/backup.tar.gz.gpg.?? > "$backup_directory/backup.tar.gz.gpg"
gpg --decrypt --batch --yes --passphrase "$BACKUP_ENCRYPTION_KEY" "$backup_directory/backup.tar.gz.gpg" > "$backup_directory/backup.tar.gz"
tar -xzf "$backup_directory/backup.tar.gz" -C "$backup_directory/restore"
