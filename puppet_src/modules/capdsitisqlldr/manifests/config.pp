# == Class: capdsitisqlldr::config
#
# Class to install the CAPD MDM Data Loader
#
# This is the configuration for the service which includes the following
#
# - Required directories
#
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include capdsitisqlldr
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdsitisqlldr::config {

  file { ['/opt/capdsitisqlldr','/opt/capdsitisqlldr/bad', '/opt/capdsitisqlldr/data', '/opt/capdsitisqlldr/config', '/opt/capdsitisqlldr/logs', '/opt/capdsitisqlldr/sqlscripts']:
    ensure => 'directory',
  }->

  file { '/opt/capdsitisqlldr/config/DbList':
    ensure  => file,
    content => template('capdsitisqlldr/DbList.erb'),
  }

  file { '/usr/bin/sqlldr':
    ensure => link,
    target => '/usr/lib/oracle/12.1/client64/bin/sqlldr',
  }

  file { '/etc/profile.d/oracle_home.sh':
    ensure  => file,
    content => 'export ORACLE_HOME=/usr/lib/oracle/12.1/client64'
  }

  exec {'sqlldr_ldconfig':
    command     => 'ldconfig',
    refreshonly => true,
  }

}
