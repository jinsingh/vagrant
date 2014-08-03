# Class defra_fw::config stores the configuration to be applied to the firewall
# specific to different config types, based on node type from hiera
# this way all fw config is referenced in one place
# thus easy to monitor/modify
#
#

class defra_fw::config {

Firewall {
      before  => Class['defra_fw::post'],
      require => Class['defra_fw::pre'],
    }

class { ['defra_fw::pre','firewall', 'defra_fw::post']: }
->
resources { 'firewall':
      purge => hiera('purge-firewall')
}


# get node type from hiera

  $node_type = hiera('defra-capd-node-type')


# this sets up an alias for iptables -vnL --line-numbers so it's way faster to inspect the rules
# with simple command iptables-list

  exec { 'create iptables alias':
      command     => 'alias iptables-list="iptables -vnL --line-numbers"',
      path        => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
      refreshonly => true,
  }

# case statement to assign different node specific fw rules
# all things common should be stored in defra_fw::pre


  case $node_type {

      /s_capservicesnodes::s_capmatching/:  { include defra_fw::services  }
      /s_capwebnodes::s_capwebauth/:        { include defra_fw::web  }
      'nodes::s_capmatching':               { include defra_fw::services  }
      'nodes::s_capservices':               { include defra_fw::services  }
      'nodes::s_capweb':                    { include defra_fw::web  }
      'nodes::s_management':                { include defra_fw::management  }
      'nodes::s_capgen':                    { include defra_fw::gen }
      'nodes::s_dbmapwms':                  { include defra_fw::dbmapwms }
      'nodes::s_vagrant':                   { include defra_fw::vagrant_fw }
      'nodes::s_capsiti':                   { include defra_fw::mocksiti }
      'nodes::s_capapp':                    { include defra_fw::capapp }
      'nodes::s_caporacledb':               { include defra_fw::oracledb }
      'nodes::s_logaggregator':             { include defra_fw::logaggregator }
      'nodes::s_monitoring':                { include defra_fw::monitoring }
      'nodes::s_graphing':                  { include defra_fw::graphing }
      'nodes::s_cap_ha_master':             { include defra_fw::ha }
      'nodes::s_cap_ha_slave':              { include defra_fw::ha }
      'nodes::s_sitiagri':                  { include defra_fw::sitiagri }
      default:                              {}

    }
}
