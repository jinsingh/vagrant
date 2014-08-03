# == Node: opsview
#
#  Puppet setup for the opsview monitoring tool
#
# === Parameters
#
#
#
# === Variables
#
#
# === Examples
#
#  na
#
# === Authors
#
# Peter Souter, peterso@kainos.com
#
# === Copyright
#
# DEFRA
#
class opsview_server {

  include opsview_server::package, opsview_server::config

  include opsview_server::servicechecks, opsview_server::provision

  include opsview_server::service

  Class['opsview_server::package'] -> Class['opsview_server::config']

  Class['opsview_server::config'] -> Class['opsview_server::service']

  Class['opsview_server::service'] -> Class['opsview_server::servicechecks']

}
