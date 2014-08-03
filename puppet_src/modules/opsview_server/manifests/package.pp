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
class opsview_server::package {

  package { 'opsview':
    ensure  => hiera('opsview-version', 'latest'),
  }
  package { 'ruby-devel':
    ensure => hiera('ruby-devel-version', 'present'),
  }
  package { 'gcc':
    ensure => hiera('gcc-version', 'present'),
  }

}
