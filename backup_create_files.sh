#!/bin/bash

set -e

# Load env variables from .env file
export $(grep -v '^#' .env | xargs)

backup_name="$1"
source_dir="$2"
find_predicate="$3"

tmp_dir="/var/tmp/backup/$backup_name/create"

(cd ${source_dir} && find . ${find_predicate} -exec cp --parents {} ${tmp_dir} \;)
