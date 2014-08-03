# Class defines an Upstart service and defines restart, start and stop commands
# as Puppet Upstart provider does not work properly on CentOS

class capdauth::service {

  service { 'capdauth':
    ensure    => running,
    hasstatus => true,
    restart   => '/sbin/restart capdauth',
    start     => '/sbin/start capdauth',
    stop      => '/sbin/stop capdauth',
    status    => '/sbin/status capdauth | grep "/running" 1>/dev/null 2>&1',
  }

}
