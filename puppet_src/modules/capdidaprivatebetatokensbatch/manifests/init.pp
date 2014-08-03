# == Class: capdsendmail
#
# CAPD idaprivatebetatokensbatch module. This module is here to install the private beta token invites
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

class capdidaprivatebetatokensbatch {

  include capdidaprivatebetatokensbatch::package, capdidaprivatebetatokensbatch::config

  Class['capdidaprivatebetatokensbatch::package'] -> Class['capdidaprivatebetatokensbatch::config']

}
