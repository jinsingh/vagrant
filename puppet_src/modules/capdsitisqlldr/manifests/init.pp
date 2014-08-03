# == Class: capdsitisqlldr
#
# Class to install the CAPD SQL LDR
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
class capdsitisqlldr {

  include capdsitisqlldr::package, capdsitisqlldr::config

  Class['capdsitisqlldr::package'] -> Class['capdsitisqlldr::config']

}
