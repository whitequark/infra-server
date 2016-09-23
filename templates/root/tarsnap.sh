#!/bin/bash -e

umask 077

DATABASES="
  roundcube
  irclogs
"

FILES="
  /var/www/doc.whitequark.org
  /var/www/files.whitequark.org
  /var/www/groupxiv.whitequark.org/public_html/data/
  /var/www/llvm.moe
  /home/whitequark
  /home/thz
"

OPTIONS="
  --exclude /var/www/groupxiv.whitequark.org/public_html/data/@-tiles
  --quiet
"

for db in ${DATABASES}; do
  sql="/var/backups/${db}.sql"
  pg_dump -C -f ${sql} ${db}
  FILES="${FILES} ${sql}"
done

set -f
tarsnap \
  --cachedir /var/cache/tarsnap \
  --keyfile /root/tarsnap-w.key \
  --checkpoint-bytes 512M \
  --humanize-numbers \
  -f backup-`date -Iseconds` \
  -c $* ${OPTIONS//@/*} ${FILES}
