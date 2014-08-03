# Set of FW rules for CAPD centralised log server
#
class defra_fw::dbmapwms{


  firewall { '901 allow connections on 8080':
    port   => '8080',
    proto  => 'tcp',
    action => 'accept',
  }

}