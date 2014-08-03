# Set of FW rules for GRAPHING server
#
class defra_fw::graphing{

  firewall { '205 allow https access':
    port   => '443',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '206 allow 80 access':
    proto  => 'tcp',
    port   => '80',
    action => 'accept',
  }

  firewall { '207 allow COLLECTD 25826 access':
    proto  => 'udp',
    port   => '25826',
    action => 'accept',
  }

  firewall { '208 allow GRAPHITE 2003 access':
    proto  => 'tcp',
    port   => '2003',
    action => 'accept',
  }

}
