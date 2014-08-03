# Set of FW rules for WEB server
#
class defra_fw::web{

  firewall { '110 allow https access':
    port   => '443',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '111 allow internal proxy access':
    port   => '8080',
    proto  => 'tcp',
    source => '10.0.0.0/8',
    action => 'accept',
  }

  if $::fqdn == 'capweb.rpa.integration' {
    firewall{'112 allow Quotium Seeker agent on 8085':
      source => '10.181.103.77',
      port   => '8085',
      proto  => 'tcp',
      action => 'accept',
    }
  }

}
