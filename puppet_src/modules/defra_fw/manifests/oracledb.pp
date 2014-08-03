# Set of FW rules for OracleDB server
# numbering convention is the same as for other DB engine (12#)
#
class defra_fw::oracledb{

  firewall{'120 allow everyone tcp in on 1521':
    port   => '1521',
    proto  => 'tcp',
    action => 'accept',
  }

  if $::fqdn == 'caporacledb.rpa.integration' {
    firewall{ '121 allow Quotium Seeker agent on 8085':
      source => '10.181.103.77',
      port   => '8085',
      proto  => 'tcp',
      action => 'accept',
    }
  }

}
