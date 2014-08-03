# Set of FW rules for WEB server
#
class defra_fw::monitoring{

  firewall { '202 allow https access':
    port   => '443',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '203 allow 80 access':
    proto  => 'tcp',
    port   => '80',
    action => 'accept',
  }

}
