## prestashop

### Description

Installs prestashop in the provided webroot for the provided domain, and then sets up an nginx site for that webroot.

### Variables

* `install_version` (string, optional, default: see source code)
  if there is no prestashop installation, install this version
* `domain` (string, required)
  the domain where the installation will be visible at the root
* `webroot` (string, optional, default: `/var/www/prestashop`)
  directory where the installation will be placed
* `prestashop` (dict, optional, default: `{shops:{"":{}}}`)
  access control configuration
    * `admin_token` (string, optional)
      the token required to access the admin panel, via the `{domain}/secret/{token}` URI
    * `cron_token` (string, optional)
      the token that the _cronjobs_ module requires for the callback
    * `shops` (dict, required)
      the set of all shops set up in a subdirectory
        * `invite_token` (string, optional)
          the token required to access the shop, via the `{domain}/{shop}/invite/{token}` URI
        * `invite_redirect` (string, optional)
          the page to redirect visitors coming through the invite link to
