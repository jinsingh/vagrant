# defines module users used to create users on boes and assign proper rights

class users {
  # include sudo

  group { 'admin':
    name => 'admin',
    gid  => 3000,
  }

  # Add admin group to sudoers only if not already there
  # exec { 'echo "%admin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers':
  #  unless => 'grep "%admin ALL=(ALL) NOPASSWD: ALL" /etc/sudoers' }

  # Make sure that below is included in the file so hardening templates are loaded
  exec { 'echo "Defaults:deploy !requiretty" >> /etc/sudoers':
    unless => 'grep "Defaults:deploy !requiretty" /etc/sudoers',
    before => Exec['echo "#includedir /etc/sudoers.d" >> /etc/sudoers']
  }

  exec { 'echo "#includedir /etc/sudoers.d" >> /etc/sudoers':
    unless => 'tail -n 1 /etc/sudoers | grep "#includedir /etc/sudoers.d" /etc/sudoers',
    before => File['10_users']
  }

  file { '10_users':
    ensure  => file,
    content => template('users/admin_users.erb'),
    path    => "/etc/sudoers.d/10_${name}",
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
  }

  # hiera_include('user-groups')
  include users::groups::production_access

}
