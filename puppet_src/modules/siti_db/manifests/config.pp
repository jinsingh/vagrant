# == Class: siti_db::config
#
# This class will deploy the configuration required for the Siti
# Agri database structure loader.
#
# This is mostly to ensure we can do the checkout of the git repo.
#
# === Parameters
#
# === Variables
#
# === Examples
#
# include siti_db::config
#
# === Authors
#
# CAPD Ops
#
# === Copyright
#
# GDS
#

class siti_db::config {

  $capd_oracle_sid = hiera('capd-oracle-sid')
#Put ssh private ssh key in place

  file { '/root/.ssh':
    ensure  => directory,
    mode    => '0700',
  }

  file { '/root/.ssh/id_rsa.pub':
    ensure  => present,
    mode    => '0600',
    source  => 'puppet:///modules/siti_db/deploy_key.pub',
    require => File['/root/.ssh'],
  }

  file { '/root/.ssh/id_rsa':
    ensure  => present,
    owner   => 'deploy',
    group   => 'deploy',
    mode    => '0600',
    source  => 'puppet:///modules/siti_db/deploy_key',
    require => [ File['/root/.ssh'], File['/root/.ssh/id_rsa.pub'] ],
  }

  #required for the oracle client to work

}
