# makes sure that service is running
# and is started automatically

class fail2ban::service {

  service { 'fail2ban':
    ensure => running,
    enable => true,
  }
}
