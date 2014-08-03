# == Class: capdinternaluseractivation::package
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
# include capdinternaluseractivation
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdinternaluseractivation::package{

package { 'capdinternaluseractivation':
    ensure  => hiera('capd-internal-user-activation-version', 'latest'),
    require => Class['repo'],
  }

}
