# == Class: capdsitisqlldr::package
#
# Class to install the CAPD SQLLDR
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
# include capdsitisqlldr
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdsitisqlldr::package{

package { 'capdsitisqlldr':
  ensure  => hiera('capd-siti-sql-ldr-version', 'latest'),
  require => Class ['repo'],
}

package { 'oracle-sqlldr':
  ensure  => hiera('oracle-sqlldr-version', 'latest'),
  require => [ Class ['repo'], Class ['sqlplus_client'] ],
  notify  => Exec ['sqlldr_ldconfig'],
}

}
