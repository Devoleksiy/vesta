<?php
// v 0.3.0
// switch-config
// -------- Settings variables Start ----------
// Redis cache settings
$redis_enable = 0;
$redis_host = 'localhost';
$redis_prefix = 'myt_';

// db settings

// Copy the settings from the settings.php file here

if (isset($databases)){
  $db_settings = $databases['default']['default'];
}
else{
  \Drupal::messenger()->addError('There is no base configuration in settings.php');
}

$db_setting_database = 'admin_mytest';
$db_setting_name = $db_settings["username"];
$db_setting_password = $db_settings["password"];
$db_setting_prefix = $db_settings["prefix"];
$db_setting_host = $db_settings["host"];
$db_setting_port = $db_settings["port"];

// -------- Settings variables End ----------

// Specific settings for machine

// ====  Production (live) machine =========================
if (file_exists("../config/env.prod")) {
  // config for production server
  $config['config_split.config_split.dev']['status'] = FALSE;
  $config['config_split.config_split.prod']['status'] = TRUE; // active

  // Enable Configuration Read-only mode
  $settings['config_readonly'] = TRUE;

}

// ====  Webtest (test) machine =============================
elseif (file_exists("../config/env.webtest")){

  // Cache setting
  $redis_prefix = 'w'.$redis_prefix;
  // DB setting
  $db_setting_database = 'admin_dev_mytest';
  $db_setting_name = 'admin_dev_mytest';

}

// ====  Dev (local) machine =============================
else {
  // config for developer (local))
  $config['config_split.config_split.dev']['status'] = TRUE; // active
  $config['config_split.config_split.prod']['status'] = FALSE;

  // Cache setting
  $redis_host = 'redis';
  // DB host
  $db_setting_host = 'mariadb';

  // Load local development override configuration, if available.
  if (file_exists($app_root . '/' . $site_path . '/settings.local.php')) {
    include $app_root . '/' . $site_path . '/settings.local.php';
  }

}

// DB set config
$databases['default']['default'] = array (
  'database' => $db_setting_database,
  'username' => $db_setting_name,
  'password' => $db_setting_password,
  'prefix' => $db_setting_prefix,
  'host' => $db_setting_host,
  'port' => $db_setting_port,
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
);

// cache set config
if ($redis_enable) {
  $settings['redis.connection']['host'] = $redis_host;
  $settings['redis.connection']['port'] = NULL;
  $settings['cache']['default'] = 'cache.backend.redis';
  // prefix for cache, example 'mysite_'.
  $settings['cache_prefix']['default'] = $redis_prefix;
}

