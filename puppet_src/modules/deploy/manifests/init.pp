# == Class: deploy
#
# Full description of class user here.
# Used to create separate user with sufficient rights to deploy but nothing more, so
# root doesn't have to be used for security reasons.
#
# =====================
class deploy {
  # include sudo


  $node_type = hiera('defra-capd-node-type')
  $deploy_key = hiera('deploy-public-key')

  if $node_type == 'nodes::s_vagrant' {

    package {'libshadow':
      ensure   => 'present',
      provider => 'gem',
    }

  }


  group {'deploy':
    ensure => 'present',
    name   => 'deploy',
  }
  user {'deploy':
    ensure           => present,
    home             => '/home/deploy',
    managehome       => true,
    shell            => '/bin/bash',
    gid              => 'deploy',
    require          => Group['deploy'],
    password_max_age => '-1',
  }


# Limit permissions on users home directory
  file { "/home/${title}" :
    ensure  => 'present',
    mode    => '0750',
    owner   => $title,
    group   => 'deploy',
    require => User['deploy']
  }

  ssh_authorized_key { 'deploy_key':
    ensure  => present,
    key     => $deploy_key,
    type    => 'ssh-rsa',
    user    => 'deploy',
    require => File["/home/${title}"]
  }

  #  # Make sure that below is included in the file so hardening templates are loaded
  # exec { 'echo "#includedir /etc/sudoers.d" >> /etc/sudoers':
  #   unless => 'grep "#includedir /etc/sudoers.d" /etc/sudoers',
  #   before => File['11_deploy'] }

  # after that place this file with deploy commands, from template
  file { '11_deploy':
    ensure  => file,
    content => template('deploy/deploy.erb'),
    path    => "/etc/sudoers.d/11_${name}",
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
  }

}
