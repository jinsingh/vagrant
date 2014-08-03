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
class opsview_agent::config {

  file { '/usr/local/nagios/etc/nrpe_local/extra_nrpe_checks.cfg' :
    ensure   => present,
    owner    => 'nagios',
    group    => 'nagios',
    mode     => '0755',
    source   => 'puppet:///modules/opsview_agent/extra_nrpe_checks.cfg',
    checksum => md5
  }

  file { '/usr/local/nagios/libexec/nrpe_local/check_process.sh' :
    ensure   => present,
    owner    => 'nagios',
    group    => 'nagios',
    mode     => '0755',
    source   => 'puppet:///modules/opsview_agent/check_process.sh',
    checksum => md5
  }

}
