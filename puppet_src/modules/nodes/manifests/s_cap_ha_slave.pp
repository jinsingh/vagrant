# == Node: nodes::s_cap_ha_slave
#
#  Node setup for the monitoring server
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
class nodes::s_cap_ha_slave inherits nodes::s_base {
  $virtual_ipaddress = hiera('capd-ha-virtual-ipaddress')
  $ha_interface      = hiera('capd-ha-interface', 'eth2')
  $external_web_address = hiera('capd-external-web-address')

  include keepalived
  include haproxy

  if $external_web_address =~ /kainos/ {
    include opsview_agent
  }

  keepalived::vrrp::instance { 'VI_50':
    interface         => $ha_interface,
    state             => 'BACKUP',
    virtual_router_id => '50',
    priority          => '100',
    auth_type         => 'PASS',
    auth_pass         => 'secret',
    virtual_ipaddress => $virtual_ipaddress,
  }
}
