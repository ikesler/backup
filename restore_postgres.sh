
backup_name="$1"
backup_directory="./$backup_name/restore"
pg_host="$2"
pg_user="$3"
pg_db="$4"

pg_restore -h ${pg_host} -p 5432 -U ${pg_user} -d ${pg_db} --clean --if-exists "$backup_directory/${pg_db}.dump"
