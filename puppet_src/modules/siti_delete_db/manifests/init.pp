# == Class: siti_delete_db
#
# Module to deploy the sqlplus scripts we need to load the Siti Agri
# data from the staging tables into production.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include siti_delete_db
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#
class siti_delete_db {

  file { '/opt/siti-delete-db':
    ensure => directory,
  }

  package { 'capd-siti-delete-db':
    ensure   => hiera('capd-siti-delete-db-version', 'latest'),
    require  => Class['repo'],
  }

  file { '/opt/siti-delete-db/run_psql_scripts.sh':
    ensure  => present,
    mode    => '0750',
    owner   => deploy,
    group   => deploy,
    content => template('siti_delete_db/run_psql_scripts.sh.erb'),
    require => File['/opt/siti-delete-db'],
  }

}
