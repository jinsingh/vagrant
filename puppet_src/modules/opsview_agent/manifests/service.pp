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
class opsview_agent::service {

  service { 'opsview-agent':
    ensure => running,
    enable => true,
  }

}
