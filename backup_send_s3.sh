set -e

backup_name="$1"

source_dir="/v/backup/$backup_name/pack"

aws s3 cp "$source_dir" "s3://$BACKUP_S3_BUCKET/$backup_name" --recursive --profile backup --endpoint-url "$BACKUP_S3_ENDPOINT"

rm -rf "/v/backup/$backup_name"
