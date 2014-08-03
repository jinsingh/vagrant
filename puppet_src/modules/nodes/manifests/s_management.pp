# Node class for the management servers
class nodes::s_management inherits nodes::s_base {
  $external_web_address = hiera('capd-external-web-address')

  if $::fqdn =~ /(\.test$)+/ {
    include atomic_repo
  }
  include nc
  include yumrepo
  include postfix
  include nginx_management_proxy
  include defra_collectd

  if ($external_web_address =~ /kainos/)
  {
    unless ($external_web_address =~ /release/ )
    or ($external_web_address =~ /testing/)
    or ($external_web_address =~ /demo/ )
    or ($external_web_address =~ /performance/) {
      include opsview_agent
      include siti_simulator
    }
  }

}
