# Set of FW rules for Vagrant box
#
# only for demo/test purposes to show how to define them
# for other nodes
#
# TIP: when in need of allowing traffic from all IPs
# use 0.0.0.0/0
# and in case of all protocols use 'all'
#
# Notice chaining operators ath the end of each declration

class defra_fw::vagrant_fw{

  $allowed_hosts = hiera_array('defra-capd-smtp-allowed-hosts')


  firewall{'160 allow SMTP from all':

    port   => '25',
    action => 'accept',
  }->
  firewall{'161 allow SMTP from node':

    port   => '25',
    source => $allowed_hosts[0],
    action => 'accept',
  }->
  firewall{'162 allow SMTP from node':

    port   => '25',
    source => $allowed_hosts[1],
    action => 'accept',
  }->
  firewall{'163 allow SMTP from node':

    port   => '25',
    source => $allowed_hosts[2],
    action => 'accept',
  }->
  firewall{'164 allow SMTP from node':

    port   => '25',
    source => $allowed_hosts[3],
    action => 'accept',
  }->


  firewall{'191 block 1287 udp from 10.0.0.0/8':

    port   => '1287',
    proto  => 'udp',
    source => '10.0.0.0/8',
    action => 'reject',
  }->

  firewall{'192 block 2837':

    port   => '2837',
    proto  => 'tcp',
    action => 'reject',
  }->

  firewall{'193 block 6789 UDP':

    port   => '6789',
    proto  => 'udp',
    action => 'reject',
  }

  # $allowed_hosts = hiera_array('defra-capd-smtp-allowed-hosts')


}
