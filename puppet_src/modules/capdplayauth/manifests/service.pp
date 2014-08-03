# service for capdplayauth

class capdplayauth::service{

service { 'capdplayauth':
    ensure    => running,
    hasstatus => true,
    restart   => '/sbin/restart capdplayauth',
    start     => '/sbin/start capdplayauth',
    stop      => '/sbin/stop capdplayauth',
    status    => '/sbin/status capdplayauth | grep "/running" 1>/dev/null 2>&1',
  }

}
