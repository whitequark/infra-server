## nginx-site

### Description

Sets up a nginx site on a dedicated domain using the provided configuration, and (if requested) sets up a Let's Encrypt certificate for it.

### Variables

* `domain` (string, required)
  domain of the website
* `nginx_conf` (string, optional, default: `sites/{{domain}}.conf`)
  template for the site configuration
* `webroot` (string, optional, default: `/var/www/{{domain}}`)
  directory where certbot will place its `.well-known` subdirectory, expecting it to be visible in the root of the website
