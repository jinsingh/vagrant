# == Class: capdsendmail::package
#
# CAPD idaprivatebetatokensbatch module. This module is here to install the private beta token invites
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

class capdidaprivatebetatokensbatch::package {

  package { 'capdidaprivatebetatokensbatch':
    ensure  => hiera('capd-ida-private-beta-tokens-batch-version', 'latest'),
    require => Class['repo'],
  }

}

