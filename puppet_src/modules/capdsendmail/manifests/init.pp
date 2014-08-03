# == Class: capdsendmail
#
# CAPD sendmail module.  This module is here to install the 
# CAPD sendmail service for IDA.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include capdsendmail
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdsendmail {

  include capdsendmail::package, capdsendmail::config, capdsendmail::service

  Class['capdsendmail::package'] -> Class['capdsendmail::config'] -> Class['capdsendmail::service']

}
