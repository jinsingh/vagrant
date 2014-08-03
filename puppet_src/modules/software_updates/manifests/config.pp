# Class ensures yum-cron is configured

class software_updates::config {

$capd_updates_notification = hiera('capd-updates-notification')

  file { '/etc/sysconfig/yum-cron':
    ensure  => 'present',
    content => template('software_updates/yum-cron.erb'),
  }

  ini_setting { 'YUM Exclusions':
    ensure  => present,
    path    => '/etc/yum.conf',
    section => 'main',
    setting => 'exclude',
    value   => 'puppet*',
  }

  ini_setting { 'HTTP Caching':
    ensure  => present,
    path    => '/etc/yum.conf',
    section => 'main',
    setting => 'http_caching',
    value   => 'packages',
  }

}
