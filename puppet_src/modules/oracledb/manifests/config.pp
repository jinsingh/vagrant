#configuration scripts execution after Oracle DB setup

class oracledb::config{

$capd_oracle_sid = hiera('capd-oracle-sid')
$capd_oracle_password_system = hiera('capd-oracle-password-system')
$capd_oracle_sys_username = hiera('capd-oracle-sys-username')
$capd_oracle_username = hiera('capd-oracle-username')
$capd_oracle_capduser_password = hiera('capd-oracle-capduser-password')
$capd_oracle_auth_username = hiera('capd-oracle-auth-username')
$capd_oracle_authuser_password = hiera('capd-oracle-authuser-password')
$oracleHomeDir = hiera('capd-oracle-homedir')


  file { "${oracleHomeDir}/network/admin/tnsnames.ora":
    ensure  => present,
    owner   => 'oracle',
    group   => 'dba',
    mode    => '0640',
    content => template('oracledb/oracle_tnsnames.ora.erb'),
  }

  file { "${oracleHomeDir}/network/admin/listener.ora":
    ensure  => present,
    owner   => 'oracle',
    group   => 'dba',
    mode    => '0644',
    content => template('oracledb/oracle_listener.ora.erb'),
  }
}
