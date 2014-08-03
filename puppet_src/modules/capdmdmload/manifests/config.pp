# == Class: capdmdmload::config
#
# Class to install the CAPD MDM Data Loader
#
# This is the configuration for the service which includes the following
#
# - Required directories
# - Rsyslog logging configuration
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include capdmdmload
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdmdmload::config {

  $external_web_address = hiera('capd-external-web-address')

  file { '/opt/capdmdmload/':
    ensure => 'directory',
    owner  => 'root',
    group  => 'deploy',
    mode   => '0750',
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    file { '/etc/rsyslog.d/24-capdmdmload.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdmdmload/24-capdmdmload.conf',
    }

    include logrotate

    logrotate::file { 'capdmdmload':
      log        => '/var/log/capd/capdmdmload.log',
      options    => [ 'notifempty', 'weekly', 'rotate 14' ],
      postrotate => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    }

  }

  file { '/opt/capdmdmload/mdmDataLoad-server.properties':
    ensure  => file,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdmdmload/mdmDataLoad-server.properties.erb'),
    require => File['/opt/capdmdmload/'],
  }

  file { '/opt/capdmdmload/mdmDataLoad-storytesting.properties':
    ensure  => file,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdmdmload/mdmDataLoad-storytesting.properties.erb'),
    require => File['/opt/capdmdmload/'],
  }

  file { '/opt/capdmdmload/mdmDataLoad-storytestingbasedata.properties':
    ensure  => file,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdmdmload/mdmDataLoad-storytestingbasedata.properties.erb'),
    require => File['/opt/capdmdmload/'],
  }

}
