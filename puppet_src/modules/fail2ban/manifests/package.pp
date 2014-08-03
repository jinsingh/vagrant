# class makes sure that fail2ban package is installed

class fail2ban::package {

  package { 'fail2ban':
    ensure  => hiera('fail2ban-version', 'present'),
    notify  => Service['rsyslog'],
    require => Class['repo']
  }
}
