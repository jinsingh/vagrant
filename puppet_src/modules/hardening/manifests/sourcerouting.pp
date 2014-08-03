# Class setss a number of sysctl hardening variables
# Disables source packet routing and synbacklog
class hardening::sourcerouting {

  file { '/etc/sysctl.conf' :
    ensure   => present,
    owner    => 'root',
    group    => 'root',
    mode     => '0644',
    content  => template('hardening/sysctl.conf.erb'),
    checksum => md5
  }

  exec {'apply_sysctl':
    command     => '/sbin/sysctl -p',
    subscribe   => File['/etc/sysctl.conf'],
    refreshonly => true,
  }
}
