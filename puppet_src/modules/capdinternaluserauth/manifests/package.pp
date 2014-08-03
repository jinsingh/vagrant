# == Class: capdinternaluserauth::package
#
# Class to install the CAPD Internal User Authentication Service
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
# include capdinternaluserauth
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdinternaluserauth::package{

package { 'capdinternaluserauthservices':
    ensure  => hiera('capd-internal-user-auth-version', 'latest'),
    require => Class['repo'],
    notify  => Service['capdinternaluserauth'],
  }

}
