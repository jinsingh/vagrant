# == Node: defra_fw::vagrant
#
#  Allows Vagrant to SSH
#
# === Parameters
#
#
#
# === Variables
#
#
# === Examples
#
#  na
#
# === Authors
#
# Peter Souter, peterso@kainos.com
#
# === Copyright
#
# DEFRA
#
class defra_fw::vagrant {

  firewall { '003 accept SSH connections on 22 from management':
    port   => '22',
    proto  => 'tcp',
    source => '0.0.0.0/0',
    action => 'accept',
  }


}