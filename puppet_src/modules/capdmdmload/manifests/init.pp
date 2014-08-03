# == Class: capdmdmload
#
# Class to install the CAPD MDM Data Loader
#
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
class capdmdmload {

  include capdmdmload::package, capdmdmload::config

  Class['capdmdmload::package'] -> Class['capdmdmload::config']

}
