# == Class: capdinternaluserauth
#
# Class to install the CAPD Internal User Authentication Service,
# and define its upstart job, config file and service refresh
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
# include capdinternaluserauth
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#
class capdinternaluserauth {

  include capdinternaluserauth::package, capdinternaluserauth::config, capdinternaluserauth::service

  Class['capdinternaluserauth::package'] -> Class['capdinternaluserauth::config'] ~> Class['capdinternaluserauth::service']

}
