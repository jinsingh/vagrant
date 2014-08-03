# puppet module for sitiagri simulator (mingle 4331)
# to be used only on development environments

class siti_simulator {

include siti_simulator::package, siti_simulator::config, siti_simulator::service

Class['siti_simulator::package'] -> Class['siti_simulator::config'] ~> Class['siti_simulator::service']

}


