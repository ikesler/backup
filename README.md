Backup scripts are running in the following way:

1. `./backup_init.sh 'backup_name'` - name of the backup. It is used as a tempt folder path (under `/var/tmp/backup`) and also as key prefix in S3 bucket. Should be unique per each backup run (add some kind of timestamp). Command is executed once per backup run.
1. `./backup_create_files.sh 'backup_name' "/absolute/path/to/files/to/be/backed/up" "optional args to be passed to `find` command". Command adds files from local FS to backup. Can be run multiple times upon each backup run.
1. `./backup_pack.sh 'backup_name'`. Creating, encrypting and splitting backup archive.
1. `./backup_send_s3.sh 'backup_name'`. Sends backup archive to an S3 bucket.
1. `./restore.sh backup_name`. Restores a backup from S3 bucket.
   
By convention, files originated from a local PC (potentially, delivered to a file server by a sync) are located under D:\ drive (Windows). Restoring such backups under the same path will help programs start working with minimum configuration changes.
