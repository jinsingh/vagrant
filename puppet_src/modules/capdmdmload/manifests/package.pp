# == Class: capdmdmload::package
#
# Class to install the CAPD MDM Data Load
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
# include capdmdmload
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdmdmload::package{

package { 'capdmdmload':
    ensure  => hiera('capd-mdm-load-version', 'latest'),
    require => Class ['repo'],
  }

}
