#!/bin/bash

set -e

# Load env variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

backup_name="$1"
pg_host="$2"
pg_user="$3"
pg_db="$4"

tmp_dir="/var/tmp/backup/$backup_name/create"

pg_dumpall -h ${pg_host} -U ${pg_user} --clean --if-exists -g > "$tmp_dir/$pg_host.sql"

pg_dump -h ${pg_host} -p 5432 -U ${pg_user} -Fc ${pg_db} > "$tmp_dir/${pg_db}.dump"
