#!/bin/bash

set -e

# Load env variables from .env file
export $(grep -v '^#' .env | xargs)

backup_name="$1"
source_dir="$2"

tmp_dir="/var/tmp/backup/$backup_name/create"

ln -s ${source_dir} "$tmp_dir/$(basename ${source_dir})"
