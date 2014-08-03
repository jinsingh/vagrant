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
class opsview_server::service {

  service { 'opsview-web':
    ensure => running,
    enable => true,
  }

  service { 'httpd':
    ensure => running,
    enable => true,
  }

}
