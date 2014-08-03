# Class defra_fw::post used to declare rules to be applied at the very beginning
# these should be common to every node, and applied to every node
# as a base for further hardening
#
class defra_fw::pre{

  Firewall {
        require => undef,
      }

  $s_management_ip = hiera('management-ip-host')
  $s_monitoring_ip = hiera('capmonitoring-ip-host')
  $s_graphing_ip = hiera('capgraphing-ip-host')
  $node_type = hiera('defra-capd-node-type')
  $ci_server_ip = hiera('ci-server-ip')
  $ci_server_ip_ext = hiera('ci-server-ip-ext')

# this part is to make sure SSH access from Internet is possible only to s_capmanagement box
# and the rest can only accept SSH connections from s_capmanagement but not from outside
# world - one entry point.

  case $node_type {
      'nodes::s_management': { $source = '0.0.0.0/0' }
      'nodes::s_vagrant':    { $source = '0.0.0.0/0' }
      default:               { $source = $s_management_ip } # that makes other nodes to accept ssh only from management.
    }

      # Default firewall rules, fairly basics -> explained as per their name.

      firewall { '000 accept all icmp':
        proto   => 'icmp',
        action  => 'accept',
      }->

      firewall { '001 accept all to lo interface':
        proto   => 'all',
        iniface => 'lo',
        action  => 'accept',
      }->

      # this makes sure that any existing connections won't get dropped immediately

      firewall { '002 accept related established rules':
        proto  => 'all',
        state  => ['RELATED', 'ESTABLISHED'],
        action => 'accept',
      }->

      # this makes sure that SSH connection from management box is accepted

      firewall { '003 accept SSH connections on 22 from management':
        port   => '22',
        proto  => 'tcp',
        source => $source,
        action => 'accept',
      }->

      # that would give us a fall back option in case smth goes wrong.

      firewall { '004 accept SSH connections on 22 from the internal IP of the CI Server':
        port   => '22',
        proto  => 'tcp',
        source => $ci_server_ip,
        action => 'accept',
      }->

      firewall { '005 accept SSH connections on 22 from the external IP of CI Server':
        port   => '22',
        proto  => 'tcp',
        source => $ci_server_ip_ext,
        action => 'accept',
      }->

      firewall { '006 accept OPSVIEW connections on 5666 from monitoring internal':
        port   => '5666',
        proto  => 'tcp',
        source => $s_monitoring_ip,
        action => 'accept',
      }

      firewall { '007 accept connections from the Jump server':
        port   => '22',
        proto  => 'tcp',
        source => hiera('jumpbox-ip-host'),
        action => 'accept',
      }

      firewall { '204 accept OPSVIEW connections on 5667 from monitoring internal':
        port   => '5667',
        proto  => 'tcp',
        source => $s_monitoring_ip,
        action => 'accept',
      }

}
