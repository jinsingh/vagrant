# Module defines epel module which adds epel repo definition and GPG key

class epel {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6':
    source  => 'puppet:///modules/epel/RPM-GPG-KEY-EPEL-6',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
