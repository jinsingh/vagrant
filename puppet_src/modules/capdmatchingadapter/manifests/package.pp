# == Class: capdmatchingadapter::package
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
# include capdmatchingadapter::package
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdmatchingadapter::package {

  package { 'capdmatchingadapter':
    ensure  => hiera('capd-matching-adapter-version', 'latest'),
    require => Class['repo'],
    notify  => Service['capdmatchingadapter'],
  }

}

