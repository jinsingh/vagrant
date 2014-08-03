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

class capdmatchingadapter {

  include capdmatchingadapter::package, capdmatchingadapter::config, capdmatchingadapter::service

  Class['capdmatchingadapter::package'] -> Class['capdmatchingadapter::config'] -> Class['capdmatchingadapter::service']

}