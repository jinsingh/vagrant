# Definition of the CAPD application server role - SITI Agri application server
class nodes::s_capapp inherits nodes::s_base {
  $external_web_address = hiera('capd-external-web-address')

  include java
  include tomcat
  include capapp

  if $external_web_address =~ /kainos/ {
    include postfix
    include defra_collectd
    include opsview_agent
  }

}
