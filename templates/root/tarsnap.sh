#!/bin/bash -e

umask 077

DATE="$(date -Iseconds)"

PG_DATABASES="
  roundcube
  irclogs
"

MY_DATABASES="
  prestashop
"

FILES="
  --exclude /var/www/groupxiv.whitequark.org/public_html/data/@-tiles
  /var/lib/prestashop
  /var/www/doc.whitequark.org
  /var/www/files.whitequark.org
  /var/www/groupxiv.whitequark.org/public_html/data/
  /var/www/llvm.moe
"

for db in ${PG_DATABASES}; do
  sql="/var/backups/${db}.sql"
  pg_dump -C -f ${sql} ${db}
  FILES="${FILES} ${sql}"
done

for db in ${MY_DATABASES}; do
  sql="/var/backups/${db}.sql"
  mysqldump -r ${sql} ${db}
  FILES="${FILES} ${sql}"
done

set -f

OPTIONS="
  --cachedir /var/cache/tarsnap \
  --keyfile /root/tarsnap-w.key \
  --checkpoint-bytes 512M \
  --humanize-numbers \
  --quiet \
  --no-print-stats
"

tarsnap ${OPTIONS} \
  -f uruz-var-${DATE} \
  -c ${FILES//@/*}

tarsnap ${OPTIONS} \
  -f uruz-home-${DATE} \
  -c /home
