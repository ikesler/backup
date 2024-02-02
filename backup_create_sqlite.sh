#!/bin/bash

set -e

# Load env variables from .env file
export $(grep -v '^#' .env | xargs)

backup_name="$1"
sqlite_db_path="$2"

tmp_dir="/var/tmp/backup/$backup_name/create"
sqlite_db_filename=$(basename "$sqlite_db_path")

if [ -d "$tmp_dir" ]; then
    rm -r "$tmp_dir"
fi

mkdir -p "$tmp_dir"

sqlite3 "$sqlite_db_path" ".backup '$tmp_dir/$sqlite_db_filename'"
