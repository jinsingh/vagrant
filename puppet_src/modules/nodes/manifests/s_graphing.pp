# == Node: nodes::s_graphing
#
#  Node setup for the graphing server
#
class nodes::s_graphing inherits nodes::s_base {
  $external_web_address = hiera('capd-external-web-address')

  include graphite
  include defra_collectd

  if $external_web_address =~ /kainos/ {
    include opsview_agent
  }

}
