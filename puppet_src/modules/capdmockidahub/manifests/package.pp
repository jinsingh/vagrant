# == Class: capdmockidahub::package
#
# Class to install the CAPD Mock IDA Hub
#
# This will install the required RPM package.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include capdmockidahub
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdmockidahub::package{

package { 'capdmocksplayidahub':
    ensure  => hiera('capd-mocks-play-ida-hub-version', 'latest'),
    require => Class['repo'],
    notify  => Service['capdmockidahub'],
  }

}
