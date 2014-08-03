# == Class: sqlplus_client::package
#
# Module to install the packages for the Oracle SQLPlus client.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include sqlplus_client::package
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class sqlplus_client::package {

  $oracle_instant_client_basic_pkg = hiera('oracle-instant-client-basic-pkg')
  $oracle_instant_client_sqlplus_pkg = hiera('oracle-instant-client-sqlplus-pkg')

    package { $oracle_instant_client_basic_pkg:
      ensure  => hiera('oracle-instant-client-basic-version'),
      require => Class['repo'],
    }

    package { $oracle_instant_client_sqlplus_pkg:
      ensure  => hiera('oracle-instant-client-sqlplus-version'),
      require => Class['repo'],
    }

}
