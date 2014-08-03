# Class ensures yum-cron package is installed

class software_updates::package {

  package { 'yum-cron' :
    ensure => hiera('yum-cron-version', 'present'),
  }
}
