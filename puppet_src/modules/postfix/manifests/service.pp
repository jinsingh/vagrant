# class makes sure that psotfix is running and being stared on boot

class postfix::service {

  service {'postfix':
    ensure  => running,
    enable  => true,
    start   => '/sbin/service postfix start',
    restart => '/sbin/service postfix restart',
    stop    => '/sbin/service postfix stop',
  }

}
