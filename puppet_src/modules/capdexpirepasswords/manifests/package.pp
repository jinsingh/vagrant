# == Class: capdexpirepasswords::package
#
# Class to install the capdexpirepasswords RPM
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include capdexpirepasswords::package
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdexpirepasswords::package {

  package { 'capdexpirepasswords':
    ensure  => hiera('capd-expire-passwords-version', 'latest'),
    require => Class ['repo'],
  }

}
