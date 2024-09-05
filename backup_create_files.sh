#!/bin/bash

set -e

# Load env variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

backup_name="$1"
source_dir="$2"
find_predicate="$3"
prefix="$4"

tmp_dir="/var/tmp/backup/$backup_name/create"

(cd ${source_dir} && eval "find . $find_predicate -exec cp --parents {} $tmp_dir$prefix \;")
