## owncloud

### Description

Installs ownCloud in the provided webroot for the provided domain, and then sets up an nginx site for that webroot.

### Variables

* `domain` (string, required)
  the domain where the installation will be visible at the root
* `webroot` (string, default: `/var/www/owncloud`)
  directory where the installation will be placed
