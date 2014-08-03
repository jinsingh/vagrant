# == Class: ius
#
# Full description of class user here.
# This class is only relevant to vagrant boxes which by default don't know about IUS
# repository we make use of on rakcspace environment
# =====================

class ius{

  file {'/etc/yum.repos.d/ius.repo':
    ensure => file,
    source => 'puppet:///modules/ius/ius.repo',
  }

}
