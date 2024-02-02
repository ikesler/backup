#!/bin/bash

set -e

# Load env variables from .env file
export $(grep -v '^#' .env | xargs)

backup_name="$1"

tmp_dir="/var/tmp/backup/$backup_name/create"

if [ -d "$tmp_dir" ]; then
    rm -r "$tmp_dir"
fi

mkdir -p "$tmp_dir"
