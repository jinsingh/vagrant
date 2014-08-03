# == Class: capdidaprivatebetatokensbatch
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
# include capdidaprivatebetatokensbatch
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdidaprivatebetatokensbatch::config {

  file { '/opt/capdidaprivatebetatokensbatch':
    ensure => 'directory',
  }

  file { '/opt/capdidaprivatebetatokensbatch/config.yml':
    ensure  => present,
    content => template('capdidaprivatebetatokensbatch/config.yml'),
    require => File['/opt/capdidaprivatebetatokensbatch']
  }

}

