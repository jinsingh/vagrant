# == Class: createrepo_c
#
# createrepo_c is a clang faster alternative to createrepo
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include createrepo_c
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# DEFRA
#
class createrepo_c {

  package {'createrepo_c':
    ensure  => 'present',
    require => Class['epel']
  }

}