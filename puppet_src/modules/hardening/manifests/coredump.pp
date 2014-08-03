# Class disables core dumps

class hardening::coredump {

  # Disable core dumps on the platform
  file {'/etc/security/limits.conf' :
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('hardening/limits.conf.erb')
  }

}
