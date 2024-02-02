#!/bin/bash

set -e

# Load env variables from .env file
export $(grep -v '^#' .env | xargs)

backup_name="$1"
sqlite_db_path="$2"

sqlite_db_filename=$(basename "$sqlite_db_path")

sqlite3 "$sqlite_db_path" ".backup '$tmp_dir/$sqlite_db_filename'"
