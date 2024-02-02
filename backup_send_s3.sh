#!/bin/bash

set -e

# Load env variables from .env file
export $(grep -v '^#' .env | xargs)

backup_name="$1"

source_dir="/var/tmp/$backup_name/pack"

aws s3 cp "$source_dir" "s3://$BACKUP_S3_BUCKET/$backup_name" --recursive --profile backup --endpoint-url "$BACKUP_S3_ENDPOINT"

rm -rf "/var/tmp/backup/$backup_name"
