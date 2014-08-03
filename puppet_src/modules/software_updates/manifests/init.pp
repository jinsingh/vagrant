# Class to configure yum and ensure yum-cron is running
# to notify when software updates are available.

class software_updates {

  include software_updates::package, software_updates::config, software_updates::service

  Class['software_updates::package'] -> Class['software_updates::config'] ~> Class['software_updates::service']
}
