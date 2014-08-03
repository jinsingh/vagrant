# == Class: sqlplus_client::config
#
# Module to install the required configuration for the Oracle
# SQLPlus client.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include sqlplus_client::config
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class sqlplus_client::config {

  file { '/etc/ld.so.conf.d/sqlplus.conf':
    ensure => present,
    source => 'puppet:///modules/sqlplus_client/sqlplus.conf',
    notify => Exec['sqlplus_ldconfig'],
  }

  file { '/home/deploy/.tnsnames.ora':
    ensure  => present,
    content => template('sqlplus_client/tnsnames.ora.erb'),
    mode    => '0600',
    owner   => deploy,
    group   => deploy,
  }

  file { '/root/.tnsnames.ora':
    ensure  => present,
    content => template('sqlplus_client/tnsnames.ora.erb'),
    mode    => '0600',
    owner   => root,
    group   => root,
  }

  file { '/usr/bin/sqlplus':
    ensure => link,
    target => '/usr/bin/sqlplus64',
  }

  exec { 'sqlplus_ldconfig':
    refreshonly => true,
    path        => '/sbin',
    command     => '/sbin/ldconfig',
  }

}
