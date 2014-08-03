# Class defines an Upstart service and defines restart, start and stop commands
# as Puppet Upstart provider does not work properly on CentOS
class capdmatchingadapter::service {

  service { 'capdmatchingadapter':
    ensure    => running,
    hasstatus => true,
    restart   => '/sbin/restart capdmatchingadapter',
    start     => '/sbin/start capdmatchingadapter',
    stop      => '/sbin/stop capdmatchingadapter',
    status    => '/sbin/status capdmatchingadapter | grep "/running" 1>/dev/null 2>&1',
  }

}
