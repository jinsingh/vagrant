# Node class for the Oracle DB servers
class nodes::s_caporacledb inherits nodes::s_base {

  $external_web_address = hiera('capd-external-web-address')
  
  include postfix
  include oracledb
  include java
  include sqlplus_client
  include siti_db
  include siti_sqlplus
  include siti_delete_db
  include oracle_admin
  include defra_collectd

  if $external_web_address =~ /kainos/ {
    include opsview_agent
  }
}
