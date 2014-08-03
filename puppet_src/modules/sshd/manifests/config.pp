# proper configuration for SSHD service

class sshd::config {


  file { '/etc/ssh/sshd_config' :
    ensure  => 'present',
    content => template('sshd/etc/ssh/sshd_config.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0400',
  }

# I'd change lcation of this file to sshd directory in etc for the
# the sake of completness .Piotr.

  file { '/etc/issue.net' :
    ensure  => 'present',
    content => template('sshd/etc/issue.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0400',
  }

}
