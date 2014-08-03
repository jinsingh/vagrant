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
class opsview_agent {

  include opsview_agent::package, opsview_agent::config, opsview_agent::service

  Class['opsview_agent::package'] -> Class['opsview_agent::config'] ~> Class['opsview_agent::service']

}
