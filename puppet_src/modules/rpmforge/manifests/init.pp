# Module defines rpmforge module which adds rpmforge repo definition and GPG key

class rpmforge {

  include rpmforge::gpg_keys

  file { '/etc/yum.repos.d/rpmforge.repo':
    source  => 'puppet:///modules/rpmforge/rpmforge.repo',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
