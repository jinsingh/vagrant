# == Class: capdsendmail::package
#
# CAPD sendmail module.  This module is here to install the 
# CAPD sendmail service for IDA.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include capdsendmail
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdsendmail::package {

  package { 'capdsendmail':
    ensure  => hiera('capd-sendmail-version', 'latest'),
    require => Class['repo'],
    notify  => Service['capdsendmail'],
  }

}

