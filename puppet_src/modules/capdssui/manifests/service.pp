# Class defines an Upstart service and defines restart, start and stop commands
# as Puppet Upstart provider does not work properly on CentOS

class capdssui::service {

  service { 'capdssui':
    ensure    => running,
    hasstatus => true,
    restart   => '/sbin/restart capdssui',
    start     => '/sbin/start capdssui',
    stop      => '/sbin/stop capdssui',
    status    => '/sbin/status capdssui | grep "/running" 1>/dev/null 2>&1',
  }

}
