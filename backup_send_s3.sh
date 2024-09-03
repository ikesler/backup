#!/bin/bash

set -e

# Load env variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

backup_name="$1"

source_dir="/var/tmp/backup/$backup_name/pack"

aws s3 cp "$source_dir" "s3://$BACKUP_S3_BUCKET/$backup_name" --recursive

rm -rf "/var/tmp/backup/$backup_name"
