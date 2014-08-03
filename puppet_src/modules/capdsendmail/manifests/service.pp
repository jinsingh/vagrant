# Class defines an Upstart service and defines restart, start and stop commands
# as Puppet Upstart provider does not work properly on CentOS

class capdsendmail::service {

  service { 'capdsendmail':
    ensure    => running,
    hasstatus => true,
    restart   => '/sbin/restart capdsendmail',
    start     => '/sbin/start capdsendmail',
    stop      => '/sbin/stop capdsendmail',
    status    => '/sbin/status capdsendmail | grep "/running" 1>/dev/null 2>&1',
  }

}
