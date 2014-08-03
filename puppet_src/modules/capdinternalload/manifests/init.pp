# == Class: capdinternalload
#
# Class to install the CAPD Internal Data Loader
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
# include capdinternalload
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#
class capdinternalload {

  include capdinternalload::package, capdinternalload::config

  Class['capdinternalload::package'] -> Class['capdinternalload::config']

}