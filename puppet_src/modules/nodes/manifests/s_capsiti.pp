# Node definition for the CAPsiti servers, will only be used in development
class nodes::s_capsiti inherits nodes::s_base {
  $external_web_address = hiera('capd-external-web-address')

  include java
  include capdsitiserviceintegration
  include defra_collectd

  if $external_web_address =~ /kainos/ {
    include opsview_agent
  }
}
