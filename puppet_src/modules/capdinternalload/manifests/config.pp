# == Class: capdinternalload::config
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
# include capdinternalload
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdinternalload::config {

  $external_web_address = hiera('capd-external-web-address')

  file { '/opt/capdinternalload/':
    ensure => 'directory',
    owner  => 'root',
    group  => 'deploy',
    mode   => '0750',
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {
    file { '/etc/rsyslog.d/23-capdinternalload.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdinternalload/23-capdinternalload.conf',
    }
  }

  file { '/opt/capdinternalload/capdinternalload.properties':
    ensure  => file,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdinternalload/capdinternalload.properties.erb'),
    require => File['/opt/capdinternalload/'],
  }

}
