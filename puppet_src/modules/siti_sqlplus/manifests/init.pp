# == Class: siti_sqlplus
#
# Module to deploy the sqlplus scripts we need to load the Siti Agri
# data from the staging tables into production.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include siti_sqlplus
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#


class siti_sqlplus {

  $capd_oracle_sys_username = hiera('capd-oracle-sys-username')
  $capd_oracle_password_system = hiera('capd-oracle-password-system')
  $capd_oracle_auth_sid = hiera('capd-oracle-auth-sid')
  $abaco_db_siti_password = hiera('abaco-db-siti-password')

  file { '/opt/siti-sqlplus':
    ensure => directory,
    owner  => root,
    group  => deploy,
    mode   => '0750',
  }

  package{'capd-siti-sqlplus':
    ensure  => hiera('siti-sql-version', 'latest'),
    require => File['/opt/siti-sqlplus'],
  }

  file { '/opt/siti-sqlplus/run_siti_auth.sh':
    ensure  => present,
    mode    => '0750',
    owner   => root,
    group   => deploy,
    content => template('siti_sqlplus/opt/siti-sqlplus/run_siti_auth.sh.erb'),
    require => File['/opt/siti-sqlplus'],
  }

  file { '/opt/siti-sqlplus/run_psql_scripts.sh':
    ensure  => present,
    mode    => '0750',
    owner   => root,
    group   => deploy,
    content => template('siti_sqlplus/opt/siti-sqlplus/run_psql_scripts.sh.erb'),
    require => File['/opt/siti-sqlplus'],
  }

  file { '/opt/siti-sqlplus/destroy_siti_db.sh':
    ensure  => present,
    mode    => '0750',
    owner   => root,
    group   => deploy,
    content => template('siti_sqlplus/opt/siti-sqlplus/destroy_siti_db.sh.erb'),
    require => File['/opt/siti-sqlplus'],
  }

  file { '/opt/siti-sqlplus/add_siti_superuser.sh':
    ensure  => present,
    mode    => '0750',
    owner   => root,
    group   => deploy,
    content => template('siti_sqlplus/opt/siti-sqlplus/add_siti_superuser.sh.erb'),
    require => File['/opt/siti-sqlplus'],
  }

  file { '/opt/siti-sqlplus/abaco_for_audit_user.sh':
    ensure  => absent,
  }

  file { '/opt/siti-sqlplus/siti_access_for_audit_user.sh':
    ensure  => present,
    mode    => '0750',
    owner   => root,
    group   => deploy,
    content => template('siti_sqlplus/opt/siti-sqlplus/siti_access_for_audit_user.sh.erb'),
    require => File['/opt/siti-sqlplus'],
  }

  file { '/opt/siti-sqlplus/capd_access_for_audit_user.sh':
    ensure  => present,
    mode    => '0750',
    owner   => root,
    group   => deploy,
    content => template('siti_sqlplus/opt/siti-sqlplus/capd_access_for_audit_user.sh.erb'),
    require => File['/opt/siti-sqlplus'],
  }

  file { '/opt/siti-sqlplus/run_psql_scripts_1.5_upgrade.sh':
    ensure  => present,
    mode    => '0750',
    owner   => root,
    group   => deploy,
    content => template('siti_sqlplus/opt/siti-sqlplus/run_psql_scripts_1.5_upgrade.sh.erb'),
    require => File['/opt/siti-sqlplus'],
  }

}
