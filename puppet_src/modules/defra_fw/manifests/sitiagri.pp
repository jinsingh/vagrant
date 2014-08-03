# Set of FW rules for SitiAgri Vagrant VM server
#
class defra_fw::sitiagri{

  firewall { '998 allow 8080 access':
    proto  => 'tcp',
    port   => '8080',
    action => 'accept',
  }

  firewall { '998 allow 8090 access':
    proto  => 'tcp',
    port   => '8090',
    action => 'accept',
  }

}
