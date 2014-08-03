# == Class: capdinternalload::package
#
# Class to install the CAPD Internal Data Load
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
# include capdinternalload
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdinternalload::package{

package { 'capdinternalload':
    ensure  => hiera('capd-internal-load-version', 'latest'),
    require => Class['repo'],
  }

}
