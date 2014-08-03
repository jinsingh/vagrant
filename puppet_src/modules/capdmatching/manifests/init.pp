# == Class: capdmatching
#
# CAPD matching module.  This module is here to install the 
# CAPD matching service for IDA.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include capdmatching
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdmatching {

  include capdmatching::package, capdmatching::config, capdmatching::service

  Class['capdmatching::package'] -> Class['capdmatching::config'] -> Class['capdmatching::service']

}