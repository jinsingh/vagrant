# == Class: capdinternaluseractivation
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
# include capdinternaluseractivation
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#
class capdinternaluseractivation {

  include capdinternaluseractivation::config, capdinternaluseractivation::package

  Class['capdinternaluseractivation::package'] -> Class['capdinternaluseractivation::config']
}