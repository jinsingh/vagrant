# Class defines an Upstart service and defines restart, start and stop commands
# as Puppet Upstart provider does not work properly on CentOS

class capdservices::service {

  service { 'capdservices':
    ensure    => running,
    hasstatus => true,
    restart   => '/sbin/restart capdservices',
    start     => '/sbin/start capdservices',
    stop      => '/sbin/stop capdservices',
    status    => '/sbin/status capdservices | grep "/running" 1>/dev/null 2>&1',
  }

}
