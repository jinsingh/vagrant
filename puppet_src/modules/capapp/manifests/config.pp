# Class to deploy the Siti Agri WAR files to the Tomcat app servers.
class capapp::config {

# Put ssh private ssh key in place

$capd_oracle_sid = hiera('capd-oracle-sid')
$caporacledb_hostname = hiera('caporacledb-hostname')
$abaco_db_siti_password = hiera('abaco-db-siti-password')
$abaco_db_sitiknow_password = hiera('abaco-db-sitiknow-password')
$abaco_db_sitiknow_apps_password = hiera('abaco-db-sitiknow-apps-password')
$abaco_db_fascicolo_password = hiera('abaco-db-fascicolo-password')
$abaco_db_pams_password = hiera('abaco-db-pams-password')

  file { '/etc/tomcat6/server.xml':
    ensure  => present,
    owner   => 'root',
    group   => 'tomcat',
    mode    => '0644',
    notify  => Service['tomcat6'],
    content => template('capapp/server.xml.erb'),
  }

  file { '/etc/tomcat6/tomcat-users.xml':
    ensure  => present,
    owner   => 'root',
    group   => 'tomcat',
    mode    => '0640',
    notify  => Service['tomcat6'],
    content => template('capapp/tomcat-users.xml.erb'),
  }
}
