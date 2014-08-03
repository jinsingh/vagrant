# == Class: siti_db::package
#
# Class to install any packages required by the Siti Agri database setup system.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include siti_db::package
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class siti_db::package {

  package { 'git':
    ensure => hiera('git-version', 'latest')
  }

}
