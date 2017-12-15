#!/bin/bash -e

umask 077

DATE="$(date -Idate)"

PG_DATABASES="
{% for db in backup_objects.postgres_dbs|default([]) %}
  {{ db }}
{% endfor %}
"

MY_DATABASES="
{% for db in backup_objects.mysql_dbs|default([]) %}
  {{ db }}
{% endfor %}
"

FILES="
{% set backup_files = backup_objects.files|default({}) %}
{% for file in backup_files.exclude|default([]) %}
  --exclude {{ file | replace('*', '@') }}
{% endfor %}
{% for file in backup_files.include|default([]) %}
  {{ file | replace('*', '@') }}
{% endfor %}
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
  --keyfile /etc/backup-tarsnap.key \
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
