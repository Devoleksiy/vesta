<?php

// set up a site host for production

if (is_dir("../config/env.prod")) {
  // config for production server
  $config['config_split.config_split.dev']['status'] = FALSE;
  $config['config_split.config_split.prod']['status'] = TRUE; // active

  // Enable Configuration Read-only mode
  $settings['config_readonly'] = TRUE;

}
else {

  // config for developer (local))
  $config['config_split.config_split.dev']['status'] = TRUE; // active
  $config['config_split.config_split.prod']['status'] = FALSE;

  // Load local development override configuration, if available.
  if (file_exists($app_root . '/' . $site_path . '/settings.local.php')) {
    include $app_root . '/' . $site_path . '/settings.local.php';
  }

}
