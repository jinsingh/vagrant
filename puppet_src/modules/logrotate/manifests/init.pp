# Log Rotation Module
class logrotate {

  # logrotate rpm installation
  package { 'logrotate':
    ensure => 'installed',
  }

  # directory to hold all logrotate configs
  file { '/etc/logrotate.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['logrotate'],
  }
}

# define structure to be invoked by various systems
define logrotate::file($log, $options, $postrotate = 'NONE', $owner = 'root', $group = 'root') {
  file { "/etc/logrotate.d/${name}":
    owner   => $owner,
    group   => $group,
    mode    => '0644',
    content => template('logrotate/logrotate.erb'),
    require => File['/etc/logrotate.d'],
  }
}

