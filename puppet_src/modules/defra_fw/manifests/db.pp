# definition for fw rule
# will be applied when iterated via - allow_services_5432_from_services {$arrays::#arrayname#: }

define defra_fw::allow_services_5432_from_services () {
  firewall{"120 allow SERVICES on 5432 from services ${title}" :
    source => $title,
    proto  => 'tcp',
    port   => '5432',
    action => 'accept',
    }
  }


# Set of FW rules for DB server
#
class defra_fw::db{

# we have to include the arrays module to pull in the definitions of server groups
include arrays

  $ci_server_ip = '192.168.100.8'

  allow_services_5432_from_services {$arrays::capservices_servers: }
  ->

  firewall{'121 allow CI in on 5432':
    source => $ci_server_ip,
    port   => '5432',
    proto  => 'tcp',
    action => 'accept',
  }

}
