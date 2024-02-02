#!/bin/bash

set -e

# Load env variables from .env file
export $(grep -v '^#' .env | xargs)

backup_name="$1"
find_predicate="$2"

tmp_dir="/var/tmp/backup/$backup_name/create"

cmd="find $find_predicate -exec cp --parents {} $tmp_dir;"
echo cmd
eval emd
