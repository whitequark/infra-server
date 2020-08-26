<?php

$config = array();

include_once("/etc/roundcube/cookie.inc.php");

$config['db_dsnw'] = 'pgsql:///roundcube';

$config['default_host'] = '[::1]:1143'; // imap
$config['managesieve_host'] = '[::1]';

$config['smtp_server'] = 'localhost';
$config['smtp_port'] = 587;

$config['product_name'] = 'whitequark.org webmail';

$config['login_autocomplete'] = 2; // username and password
$config['session_domain'] = '{{domain}}';
$config['session_lifetime'] = 60*6;

$config['skin'] = 'classic';

$config['plugins'] = array(
  'archive',
  'contextmenu',
  'filesystem_attachments',
  'hide_blockquote',
  'jqueryui',
  'keyboard_shortcuts',
  'managesieve',
  'markasjunk',
  'subscriptions_option',
  'vcard_attachments',
  'zipdownload',
);

$config['zipdownload_attachments'] = 0; // allow downloading even one
$config['zipdownload_selection'] = true; // allow downloading selection
$config['zipdownload_charset'] = 'UTF-8';
