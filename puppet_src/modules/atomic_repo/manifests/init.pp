# Module defines yum repo located on management server for all hosts

class atomic_repo {

  case $::osfamily {
    'RedHat': {

      yumrepo { 'atomic':
        mirrorlist     => 'http://updates.atomicorp.com/channels/mirrorlist/atomic/centos-$releasever-$basearch',
        enabled        => '1',
        gpgcheck       => '1',
        gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY.art.txt',
        descr          => 'Atomic Rocket Turtle RPM Repository for CentOS / Red Hat Enterprise Linux 6'
      }

      file { '/etc/pki/rpm-gpg/RPM-GPG-KEY.art.txt':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/atomic_repo/RPM-GPG-KEY.art.txt',
      }
    }
    default: {}
  }

}
