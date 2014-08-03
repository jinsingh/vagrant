# Node class for the Siti Agri servers
class nodes::s_sitiagri inherits nodes::s_base {
  $graphite_hostname = hiera('capgraphing-hostname')

  include capapp
  include capddata
  include capdinternalload
  include capdinternaluserauth
  include capdmdmload
  include capdtasks
  include java
  include oracle_admin
  include siti_data
  include siti_dataloader
  include siti_db
  include siti_dbmapwms
  include siti_delete_db
  include siti_sqlplus
  include sqlplus_client
  include swap_file
  include tomcat

  package { 'libaio':
    ensure => installed,
  }

}
