# Class defines postgresql repo GPG keys

class postgresql::repo {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-PGDG-92':
    source  => 'puppet:///modules/postgresql/RPM-GPG-KEY-PGDG-92',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  file { '/etc/yum.repos.d/pgdg-92-centos.repo':
    source  => 'puppet:///modules/postgresql/pgdg-92-centos.repo',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
