# Node class for the CAP services servers
class nodes::s_capservices inherits nodes::s_base {
  $external_web_address = hiera('capd-external-web-address')

  include java
  include capdservices
  include capddata
  include capdtasks
  include memcached
  include capdsendmail
  include capdinternalload
  include capdidaprivatebetatokensbatch
  include capdinternaluseractivation
  include capdmdmload
  include capdexpirepasswords
  include capdmatching
  include siti_db
  include siti_data
  include siti_sqlplus
  include siti_delete_db
  include sqlplus_client
  include oracle_admin
  include siti_rlr_gi_loader
  include capdinternaluserauth
  include defra_collectd
  include siti_dataloader
  include capdsitisqlldr
  
  if $external_web_address =~ /kainos/ {
    include opsview_agent
    include postfix
  }
}
