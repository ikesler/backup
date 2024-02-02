#!/bin/bash

set -e

backup_name="$1"
sqlite_db_path="$2"

tmp_dir="/var/tmp/backup/$backup_name/create"
sqlite_db_filename=$(basename "$sqlite_db_path")

if [ -d "$tmp_dir" ]; then
    rm -r "$tmp_dir"
fi

mkdir -p "$tmp_dir"

sqlite3 "$sqlite_file" ".backup '$tmp_dir/$sqlite_db_filename'"
