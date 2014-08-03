# Set of FW rules for CAPD centralised log server
#
class defra_fw::logaggregator{

  firewall { '210 allow rsyslog in on default port 514':
    port   => '514',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '211 allow rsyslog in on default port 514':
    port   => '514',
    proto  => 'udp',
    action => 'accept',
  }

  # firewall { '212 allow connections to elasticsearch':
  #   port   => '9200',
  #   proto  => 'tcp',
  #   action => 'accept',
  # }

  firewall { '213 allow connections to Kibana on 80':
    port   => '80',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '213 allow connections to Kibana on 443':
    port   => '443',
    proto  => 'tcp',
    action => 'accept',
  }

}