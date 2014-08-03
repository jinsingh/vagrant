# Class defines an Upstart service and defines restart, start and stop commands
# as Puppet Upstart provider does not work properly on CentOS

class capdsitiserviceintegration::service {

  service { 'capdsitiserviceintegration':
    ensure    => running,
    hasstatus => true,
    restart   => '/sbin/restart capdsitiserviceintegration',
    start     => '/sbin/start capdsitiserviceintegration',
    stop      => '/sbin/stop capdsitiserviceintegration',
    status    => '/sbin/status capdsitiserviceintegration | grep "/running" 1>/dev/null 2>&1',
  }

}
