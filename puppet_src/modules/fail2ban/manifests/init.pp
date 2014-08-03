# defines module fail2ban and it's classes

class fail2ban {

  include fail2ban::package, fail2ban::config, fail2ban::service

  Class['fail2ban::package'] -> Class['fail2ban::config'] ~> Class['fail2ban::service']

}
