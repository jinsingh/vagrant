

# definition for ida proxy from services rule
# will be applied when iterated via - allow_ida_proxy_from_services {$arrays::#arrayname#: }

define defra_fw::allow_ida_proxy_from_services () {
  firewall{"215 allow IDA proxy from services ${title}" :
    source => $title,
    proto  => 'tcp',
    port   => $defra_fw::management::ida_proxy_port,
    action => 'accept',
    }
  }
# definition for smtp from services rule
# will be applied when iterated via - allow_smtp_from_services {$arrays::#arrayname#: }

define defra_fw::allow_smtp_from_services () {
  firewall{ "161 allow SMTP from services ${title}":
    source => $title,
    proto  => 'tcp',
    port   => '25',
    action => 'accept',
    }
  }

# Set of FW rules for MANAGEMENT server
#

class defra_fw::management {

# we have to include the arrays module to pull in the definitions of server groups
  include arrays::servers

$defra_fw_web = hiera('capweb-ip-host')
$defra_fw_log = hiera('logaggregator-ip-host')
$ida_proxy_port = hiera('ida-proxy-port')

firewall{ '160 accept 80':
    proto  => 'tcp',
    port   => '80',
    action => 'accept',
  }
  ->

allow_smtp_from_services {$arrays::servers::capservices_servers: }
  ->

# rules below are to enable other servers to relay mail through management box, hence port 25 is open for them
# this can't be done using a whole array in one rule, as due to a bug fw doesn't accept more than one entry for source param


firewall{'162 allow SMTP from central log server':
    port   => '25',
    proto  => 'tcp',
    source => $defra_fw_log,
    action => 'accept',
  }
  ->

  firewall{'163 allow SMTP from web':
    source => $defra_fw_web,
    port   => '25',
    proto  => 'tcp',
    action => 'accept',
  }
  ->

  allow_ida_proxy_from_services {$arrays::servers::capservices_servers: }
  ->

  firewall{'216 Allow OpenVAS from CAPDevelopment':
    source => '46.237.130.38',
    proto  => 'tcp',
    port   => '9392',
    action => 'accept',
  }
  ->

  firewall{'217 allow IDA proxy from web':
    source => $defra_fw_web,
    port   => $ida_proxy_port,
    proto  => 'tcp',
    action => 'accept',
  }
  ->
  firewall{'218 allow siti agri simulator requests':
    port   => '9500',
    proto  => 'tcp',
    action => 'accept',
  }
}