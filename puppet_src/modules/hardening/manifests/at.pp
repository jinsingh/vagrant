# Class restricts access to at task scheduler.

class hardening::at {

  file {'/etc/at.allow' :
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('hardening/at.allow.erb')
  }

}
