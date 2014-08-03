# Configuration for capdexpirepasswords

class capdexpirepasswords::config {


  $external_web_address = hiera('capd-external-web-address')

  # nightly cron job for capd-expire-passwords-batch.jar
  cron { 'capdexpirepasswords' :
    ensure   => present,
    user     => 'root',
    minute   => [0],
    hour     => '2',
    command  => '/opt/capdexpirepasswords/expire-passwords.sh',
    require  => File['/opt/capdexpirepasswords'],
  }

  file { '/opt/capdexpirepasswords':
    ensure   => directory,
    mode     => '0640',
    owner    => root,
    group    => deploy,
  }

  # Properties file:
  file { '/opt/capdexpirepasswords/expirepasswords.properties':
    ensure   => present,
    content  => template('capdexpirepasswords/expirepasswords.properties.erb'),
    mode     => '0640',
    owner    => root,
    group    => deploy,
    require  => File['/opt/capdexpirepasswords'],
  }

  # Shell script for expiring passwords, run by cron and in ad-hoc forced expiry:
  file { '/opt/capdexpirepasswords/expire-passwords.sh':
    ensure   => present,
    mode     => '0750',
    owner    => root,
    group    => deploy,
    source   => 'puppet:///modules/capdexpirepasswords/expire-passwords.sh',
    require  => File['/opt/capdexpirepasswords'],
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    # Plugin for syslogging CAPDEXPIREPASSWORDS:
    file { '/etc/rsyslog.d/31-capdexpirepasswords.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdexpirepasswords/31-capdexpirepasswords.conf',
    }

    # Replace installer's logrotate with correct log path:
    include logrotate

    logrotate::file { 'capdexpirepasswords':
      log        => '/var/log/capd/capdexpirepasswords.log',
      options    => [ 'notifempty', 'weekly', 'rotate 14' ],
      postrotate => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    }
  }
}
