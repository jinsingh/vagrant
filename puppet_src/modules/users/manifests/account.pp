# defines user:account so that it can be easily inflated

define users::account ($fullname, $email, $ssh_key, $ssh_key_type = 'ssh-rsa') {
  user { $title:
    ensure           => present,
    comment          => "${fullname} <${email}>",
    home             => "/home/${title}",
    managehome       => true,
    groups           => ['admin'],
    shell            => '/bin/bash',
    password_max_age => '-1',
    provider         => 'useradd',
  }

  # Limit permissions on users home directory
  file { "/home/${title}" :
    ensure => 'present',
    mode   => '0750',
    owner  => $title,
    group  => 'admin',
  }

  ssh_authorized_key { "${title}_key":
    ensure => present,
    user   => $title,
    key    => $ssh_key,
    type   => $ssh_key_type,
  }
}
