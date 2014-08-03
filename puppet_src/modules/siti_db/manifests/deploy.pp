# == Class: siti_db::deploy
#
# This class is here to deploy the Siti Agri database structure builder
# application
#
# === Parameters
#
# === Variables
#
#
# === Examples
#
#  include siti_db::deploy
#
# === Authors
#
# CAPD Ops
#
# === Copyright
#
# GDS
#
class siti_db::deploy {

$oracle_system_passwd = hiera('capd-oracle-password-system')
$oracle_system_username = hiera('capd-oracle-sys-username')
$oracle_sid = hiera('capd-oracle-sid')
$abaco_db_siti_password = hiera('abaco-db-siti-password')
$abaco_db_sitiknow_password = hiera('abaco-db-sitiknow-password')
$abaco_db_sitiknow_apps_password = hiera('abaco-db-sitiknow-apps-password')
$abaco_db_fascicolo_password = hiera('abaco-db-fascicolo-password')
$abaco_db_pams_password = hiera('abaco-db-pams-password')
$abaco_db_dyla_password = hiera('abaco-db-dyla-password')
$abaco_smtp_from = hiera('abaco-smtp-from')
$abaco_smtp_to = hiera('abaco-smtp-to')
$abaco_dbgis_port = hiera('abaco-dbgis-port')
$capapp_ip_host = hiera('capapp-ip-host')
$siti_oracle_config_version = hiera('siti-oracle-config-version')

  package { 'capd-siti-oracle-config':
    ensure  => hiera('siti-oracle-config-version', 'latest'),
    require => Class['repo'],
    notify  => Exec['sitiagri_db_update'],
  }


  file { '/opt/capd-siti-oracle-config':
    ensure  => directory,
    owner   => 'root',
    recurse => true,
    group   => 'deploy',
    mode    => '0777',
  }

  file { '/opt/capd-siti-oracle-config/config':
    ensure  => directory,
    owner   => 'root',
    recurse => true,
    group   => 'deploy',
    mode    => '0777',
  }

  file { '/opt/capd-siti-oracle-config/params.xml':
    ensure  => present,
    content => template('siti_db/params.xml.erb'),
    require => Package['capd-siti-oracle-config'],
  }

  exec { 'sitiagri_db_update':
    refreshonly => true,
    cwd         => '/opt/capd-siti-oracle-config',
    environment => 'LD_LIBRARY_PATH=/oracle/dbhome_1/bin',
    command     => 'bash -c "/usr/bin/java -jar db-update-1.2.jar -upd-dir scripts 2>&1 | tee >(logger -t SITIDB -p daemon.info)"',
  }

}
