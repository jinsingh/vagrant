# Node class for the CAP web servers
class nodes::s_capweb inherits nodes::s_base {
  $external_web_address = hiera('capd-external-web-address')

  include java
  include capdssui
  include nginx
  include libluajit

  if $external_web_address =~ /kainos/ {
    include opsview_agent
    include capdmockidahub
    include defra_collectd
    include postfix
  }
}
