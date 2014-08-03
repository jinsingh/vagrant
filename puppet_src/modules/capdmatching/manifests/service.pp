# Class defines an Upstart service and defines restart, start and stop commands
# as Puppet Upstart provider does not work properly on CentOS

class capdmatching::service {

  service { 'capdmatching':
    ensure    => running,
    hasstatus => true,
    restart   => '/sbin/restart capdmatching',
    start     => '/sbin/start capdmatching',
    stop      => '/sbin/stop capdmatching',
    status    => '/sbin/status capdmatching | grep "/running" 1>/dev/null 2>&1',
  }

}
