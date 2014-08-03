# Configuration for rootkit hunter

class rkhunter::config {

$capd_securityalert_notification = hiera('capd-securityalert-notification')

  # this should be somwhere different? Piotr.
  file { '/etc/default/rkhunter':
    ensure  => 'present',
    content => template('rkhunter/etc/default/rkhunter'),

  }

  file { '/etc/rkhunter.conf':
    ensure  => 'present',
    content => template('rkhunter/etc/rkhunter.conf.erb'),
  }

  # TMPDIR required for unhide function
  file { 'TMPDIR':
    ensure => directory,
    path   => '/var/lib/rkhunter/tmp',
  }

  file { 'unhide.rb':
    ensure  => present,
    path    => '/usr/bin/unhide.rb',
    content => '/etc/puppet/modules/files/rkhunter/unhide.rb'
  }

  # this makes sure that rootkit scan is going to take place every day at 11 o'clock
  # can we force update here as well? Piotr.

  cron { 'rkhunter' :
    ensure  => present,
    user    => 'root',
    minute  => [0],
    hour    => '2',
    command => '/usr/bin/rkhunter --cronjob --configfile /etc/rkhunter.conf 2>&1 | logger -t RKHUNTER -p daemon.info',
    require => Package['rkhunter'],
  }

# Remove duplicate cron job from cron.daily added by rkh installer:
  file { 'rkhunter-cron-daily':
    ensure  => absent,
    path    => '/etc/cron.daily/rkhunter',
  }

# Plugin for syslogging RKHUNTER:
  file { '/etc/rsyslog.d/20-rkhunter.conf':
    ensure => present,
    notify => Service['rsyslog'],
    source => 'puppet:///modules/rkhunter/20-rkhunter.conf',
  }

# Replace installer's logrotate with correct log path:
  include logrotate

  logrotate::file { 'rkhunter':
    log        => '/var/log/rkhunter.log',
    options    => [ 'notifempty', 'weekly', 'rotate 14' ],
    postrotate => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
  }
}
