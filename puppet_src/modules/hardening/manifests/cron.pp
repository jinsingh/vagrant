# Class disables access to cron for all users except root.

class hardening::cron {

  file {'/etc/cron.allow' :
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('hardening/cron.allow.erb')
  }

}
