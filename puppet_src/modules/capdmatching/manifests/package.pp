# == Class: capdmatching::package
#
# CAPD matching module.  This module is here to install the 
# CAPD matching service for IDA.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include capdmatching
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdmatching::package {

  package { 'capdmatching':
    ensure  => hiera('capd-matching-version', 'latest'),
    require => Class['repo'],
    notify  => Service['capdmatching'],
  }

}

