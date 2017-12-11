## tarsnap

### Description

Installs tarsnap and sets up a script to run backups of given MySQL and PostgreSQL databases daily.

### Variables

* `backup_objects` (dict, default: `{}`)
  set of objects to back up
  * `postgres_dbs` (list, optional):
    list of postgres databases to back up
  * `mysql_dbs` (list, optional):
    list of mysql databases to back up
  * `files` (dict, optional):
    list of files and directories to back up
    * `include` (list, optional):
      list of roots for traversing the filesystem
    * `exclude` (list, optional):
      list of trees to exclude after traversing the filesystem
