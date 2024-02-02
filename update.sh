#!/bin/bash

git checkout .
git pull
chmod +x ./backup_create_sqlite.sh
chmod +x ./backup_pack.sh
chmod +x ./backup_send_s3.sh
