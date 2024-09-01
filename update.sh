#!/bin/bash

git checkout .
git pull
chmod +x ./backup_init.sh
chmod +x ./backup_create_sqlite.sh
chmod +x ./backup_create_files.sh
chmod +x ./backup_create_dir.sh
chmod +x ./backup_create_postgres.sh
chmod +x ./backup_pack.sh
chmod +x ./backup_send_s3.sh
chmod +x ./update.sh

rm -rf /var/tmp/backup
mkdir -p /var/tmp/backup
