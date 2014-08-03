# == Class: oracle_admin
#
# Module to install the CAPD Oracle admin scripts to drop and create our users.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include oracle_admin
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class oracle_admin {

  file { '/opt/capdoracle':
    ensure => directory,
    owner  => root,
    group  => deploy,
    mode   => '0750',
  }

  file { '/opt/capdoracle/create_users.sh':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('oracle_admin/create_users.sh.erb'),
    require => File['/opt/capdoracle'],
  }

  file { '/opt/capdoracle/drop_database.sh':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('oracle_admin/drop_database.sh.erb'),
    require => File['/opt/capdoracle'],
  }

  file { '/opt/capdoracle/create_audit.sh':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('oracle_admin/create_audit.sh.erb'),
    require => File['/opt/capdoracle'],
  }

  #Creating users for the SitiAgri application

  file { '/opt/capdoracle/sitiagri':
    ensure  => directory,
    owner   => root,
    group   => deploy,
    mode    => '0750',
    require => File['/opt/capdoracle'],
  }

  file { '/opt/capdoracle/sitiagri/add_users.sh':
    ensure  => present,
    owner   => root,
    group   => deploy,
    mode    => '0750',
    content => template('oracle_admin/sitiagri/add_users.sh.erb'),
    require => File['/opt/capdoracle/sitiagri'],
  }

  file { '/opt/capdoracle/sitiagri/add_users.sql':
    ensure  => present,
    owner   => root,
    group   => deploy,
    mode    => '0640',
    source  => 'puppet:///modules/oracle_admin/sitiagri/add_users.sql',
    require => File['/opt/capdoracle/sitiagri'],
  }

  file { '/opt/capdoracle/sitiagri/01_tablespaces.sql':
    ensure  => present,
    owner   => root,
    group   => deploy,
    mode    => '0640',
    content => template('oracle_admin/sitiagri/01_tablespaces.sql.erb'),
    require => File['/opt/capdoracle/sitiagri'],
  }

  file { '/opt/capdoracle/sitiagri/02_users.sql':
    ensure  => present,
    owner   => root,
    group   => deploy,
    mode    => '0640',
    content => template('oracle_admin/sitiagri/02_users.sql.erb'),
    require => File['/opt/capdoracle/sitiagri'],
  }
    
  file { '/opt/capdoracle/reset_flags.sh':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('oracle_admin/reset_flags.sh.erb'),
    require => File['/opt/capdoracle'],
  }
}
