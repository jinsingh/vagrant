# Module defines rpmforge module gpg keys

class rpmforge::gpg_keys {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag':
    source  => 'puppet:///modules/rpmforge/RPM-GPG-KEY-rpmforge-dag',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-fabian':
    source  => 'puppet:///modules/rpmforge/RPM-GPG-KEY-rpmforge-fabian',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
