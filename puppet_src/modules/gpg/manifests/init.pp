# == Class: gpg
#
#  Add GPG keys to Vagrant
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
class gpg::vagrant {

  file { '/root/.gnupg/gpg.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/gpg/gpg.conf',
  }

  file { '/root/.gnupg/private.key':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/gpg/private.keepkey',
  }

  file { '/root/.gnupg/pubring.gpg':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/gpg/pubring.gpg',
  }

  file { '/root/.gnupg/random_seed':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/gpg/random_seed',
  }

  file { '/root/.gnupg/secring.gpg':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/gpg/secring.gpg',
  }

  file { '/root/.gnupg/trustdb.gpg':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/gpg/trustdb.gpg',
  }


}