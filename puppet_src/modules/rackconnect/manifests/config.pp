# Config file for rackconnect module
# it's job is to ensure
# there's a file created in /etc/
# named rackconnect-allow-custom-iptables
#
class rackconnect::config {

  exec { 'create /etc/rackconnect-allow-custom-iptables':
    command => 'touch /etc/rackconnect-allow-custom-iptables',
    creates => '/etc/rackconnect-allow-custom-iptables'
}

  # this is to allow RackConnect into our boxes
  # so they won't get flagged and we won't get flooded
  # with tickets about this

  firewall{'201 allow RackConnect SSH #1':
    source => '31.222.161.245',
    port   => '22',
    proto  => 'tcp',
    action => 'accept',
  }
  firewall{'202 allow RackConnect SSH #2':
    source => '10.177.0.105',
    port   => '22',
    proto  => 'tcp',
    action => 'accept',
  }
  firewall{'203 allow RackConnect SSH #3':
    source => '31.222.180.84',
    port   => '22',
    proto  => 'tcp',
    action => 'accept',
  }
  firewall{'204 allow RackConnect SSH #4':
    source => '10.176.3.158',
    port   => '22',
    proto  => 'tcp',
    action => 'accept',
  }
}
