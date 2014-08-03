# Definition of the CAPD DBMap WMS server role - SITI Agri DBMap WMS servers
class nodes::s_dbmapwms inherits nodes::s_base {
  $external_web_address = hiera('capd-external-web-address')

  include java
  include siti_dbmapwms
  include sqlplus_client
  include siti_data
  include siti_dataloader

  package { 'libaio':
    ensure => installed,
  }

  if $external_web_address =~ /kainos/ {
    include defra_collectd
    include postfix
    include opsview_agent
  }

}
