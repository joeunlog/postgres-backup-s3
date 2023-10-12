#! /bin/sh

set -eu

if [ "$S3_S3V4" = "yes" ]; then
  aws configure set default.s3.signature_version s3v4
fi

if [ "$BACKUP" = yes ]; then
  sh backup.sh
else
  sh restore.sh
fi



# if [ -z "$SCHEDULE" ]; then
#   sh backup.sh
# else
#   exec go-cron "$SCHEDULE" /bin/sh backup.sh
# fi
