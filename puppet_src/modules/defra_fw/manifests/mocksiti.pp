# Set of FW rules for Mocksiti server
#
class defra_fw::mocksiti{

  firewall { '200 allow https access':
    port   => '443',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '201 allow 8080 access':
    proto  => 'tcp',
    port   => '8080',
    action => 'accept',
  }

  if $::fqdn == 'capabacocomm.rpa.integration' {
    firewall{ '202 allow Quotium Seeker agent on 8085':
      source => '10.181.103.77',
      port   => '8085',
      proto  => 'tcp',
      action => 'accept',
    }
  }

}
