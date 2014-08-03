# == Class: capdinternaluseractivation::config
#
# Class to install the CAPD Internal Data Loader
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
# include capdinternaluseractivation
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdinternaluseractivation::config {

  $external_web_address = hiera('capd-external-web-address')

  file { '/opt/capdinternaluseractivation':
    ensure   => 'directory',
    mode     => '0640',
    owner    => root,
    group    => deploy,
  }

  # nightly cron job for capdinternaluseractivation.jar
  cron { 'capdinternaluseractivation' :
    ensure   => present,
    user     => 'root',
    minute   => [0],
    hour     => '2',
    command  => '/opt/capdinternaluseractivation/capdinternaluseractivation.sh',
    require  => File['/opt/capdinternaluseractivation'],
  }

  # Shell script for deactivating internal users, run by cron and in ad-hoc forced :
  file { '/opt/capdinternaluseractivation/capdinternaluseractivation_batch.sh':
    ensure   => present,
    mode     => '0750',
    owner    => root,
    group    => deploy,
    source   => 'puppet:///modules/capdinternaluseractivation/capdinternaluseractivation_batch.sh',
    require  => File['/opt/capdinternaluseractivation'],
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    # Plugin for syslogging capdinternaluseractivation:
    file { '/etc/rsyslog.d/23-capdinternaluseractivation.conf':
      ensure => present,
      mode   => '0640',
      owner  => root,
      group  => deploy,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdinternaluseractivation/23-capdinternaluseractivationbatch.conf',
    }

    # Replace installer's logrotate with correct log path:
    include logrotate

    logrotate::file { 'capdinternaluseractivation':
      log        => '/var/log/capd/capdinternaluseractivation.log',
      options    => [ 'notifempty', 'weekly', 'rotate 14' ],
      postrotate => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    }
  }

  file { '/opt/capdinternaluseractivation/capd-internal-user-activation-batch.log':
    ensure   => present,
    mode     => '0660',
    owner    => root,
    group    => deploy,
  }

  file { '/opt/capdinternaluseractivation/archive':
    ensure  => directory,
    owner   => root,
    group   => deploy,
    recurse => true,
    mode    => '0750',
  }

  file { '/opt/capdinternaluseractivation/InternalUserDeactivationConfiguration.yml':
    ensure  => present,
    owner   => root,
    group   => deploy,
    mode    => '0640',
    content => template('capdinternaluseractivation/InternalUserDeactivationConfiguration.yml.erb'),
    require => File['/opt/capdinternaluseractivation/'],
  }

  file { '/opt/capdinternaluseractivation/InternalUserReactivationConfiguration.yml':
    ensure  => present,
    owner   => root,
    group   => deploy,
    mode    => '0640',
    content => template('capdinternaluseractivation/InternalUserReactivationConfiguration.yml.erb'),
    require => File['/opt/capdinternaluseractivation/'],
  }

  file { '/opt/capdinternaluseractivation/InternalUserReactivationConfiguration_test.yml':
    ensure  => present,
    owner   => root,
    group   => deploy,
    mode    => '0640',
    content => template('capdinternaluseractivation/InternalUserReactivationConfiguration_test.yml.erb'),
    require => File['/opt/capdinternaluseractivation/'],
  }


}
