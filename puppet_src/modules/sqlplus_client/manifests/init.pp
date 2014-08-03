# == Class: sqlplus_client
#
# Module to install the Oracle SQLPlus client on RedHat based systems.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include sqlplus_client
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class sqlplus_client {

  include sqlplus_client::package, sqlplus_client::config

  Class['sqlplus_client::package'] -> Class['sqlplus_client::config']

}
