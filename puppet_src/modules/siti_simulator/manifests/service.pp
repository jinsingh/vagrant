#service description for siti-simulator node app
class siti_simulator::service{

  service { 'siti-simulator':
    ensure    => running,
    status    => 'curl -s 127.0.0.1:9500 >/dev/null',
    start     => '/usr/bin/forever start /opt/siti-simulator/server.js -m 1',
    stop      => '/usr/bin/forever stopall',
    restart   => '/usr/bin/forever stopall; /usr/bin/forever start /opt/siti-simulator/server.js -m 1',
  }

}