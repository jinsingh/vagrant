# Class defines an Upstart service and defines restart, start and stop commands
# as Puppet Upstart provider does not work properly on CentOS

class capdinternaluserauth::service {

  service { 'capdinternaluserauth':
    ensure    => running,
    hasstatus => true,
    restart   => '/sbin/restart capdinternaluserauth',
    start     => '/sbin/start capdinternaluserauth',
    stop      => '/sbin/stop capdinternaluserauth',
    status    => '/sbin/status capdinternaluserauth | grep "/running" 1>/dev/null 2>&1',
  }

}
