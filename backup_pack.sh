#!/bin/bash
set -e

# Load env variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

backup_name="$1"
tar_options="$2"

source_dir="/var/tmp/backup/$backup_name/create"
target_dir="/var/tmp/backup/$backup_name/pack"
mkdir -p "$target_dir"

cd "$source_dir"

timeout 300s tar ${tar_options} -czhf "$target_dir/backup.tar.gz" .
cat "$target_dir/backup.tar.gz" | age -r ${BACKUP_AGE_KEY} > "$target_dir/backup.tar.gz.age"

cd "$target_dir"

timeout 300s split -b 100m backup.tar.gz.age backup.tar.gz.age.

rm backup.tar.gz.age
rm backup.tar.gz
