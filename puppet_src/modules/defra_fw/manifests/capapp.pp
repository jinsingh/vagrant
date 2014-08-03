# Set of FW rules for CAPD application server
#
class defra_fw::capapp{

  firewall { '170 allow application server access':
    port   => '8080',
    proto  => 'tcp',
    action => 'accept',
  }

}
