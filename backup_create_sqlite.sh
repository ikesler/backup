#!/bin/bash

set -e

# Load env variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

backup_name="$1"
sqlite_db_path="$2"

tmp_dir="/var/tmp/backup/$backup_name/create"
sqlite_db_filename=$(basename "$sqlite_db_path")

sqlite3 "$sqlite_db_path" ".backup '$tmp_dir/$sqlite_db_filename'"
