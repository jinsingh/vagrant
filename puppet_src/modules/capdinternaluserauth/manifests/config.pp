# == Class: capdinternaluserauth::config
#
# Class to install the CAPD Internal User Authentication Service
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
# include capdinternaluserauth
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdinternaluserauth::config {

  $external_web_address = hiera('capd-external-web-address')

  file { '/opt/capdinternaluserauthservices/':
    ensure => 'directory',
    owner  => root,
    group  => deploy,
    mode   => '0750',
  }

  file {'/etc/init/capdinternaluserauth.conf':
    ensure => present,
    owner  => root,
    group  => deploy,
    mode   => '0640',
    source => 'puppet:///modules/capdinternaluserauth/capdinternaluserauth-job.conf',
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    file { '/etc/rsyslog.d/25-capdinternaluserauth.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdinternaluserauth/25-capdinternaluserauth.conf',
    }

    include logrotate

    logrotate::file { 'capdinternaluserauth':
      log        => '/var/log/capd/capdinternaluserauth.log',
      options    => [ 'notifempty', 'weekly', 'rotate 14' ],
      postrotate => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    }
  }

  file { '/opt/capdinternaluserauthservices/capdinternaluserauthConfig.yml':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdinternaluserauth/capdinternaluserauthConfig.yml.erb'),
    notify  => Service['capdinternaluserauth'],
  }

}
