# install sshd package (should be there already but to make sure it's there)

class sshd::package {

  package { 'openssh-server' :
    ensure => hiera('openssh-server-version', 'present'),
  }

}
