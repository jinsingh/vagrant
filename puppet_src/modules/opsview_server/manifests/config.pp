# == Node: opsview
#
#  Puppet setup for the opsview monitoring tool
#
# === Parameters
#
#
#
# === Variables
#
#
# === Examples
#
#  na
#
# === Authors
#
# Peter Souter, peterso@kainos.com
#
# === Copyright
#
# DEFRA
#
class opsview_server::config {
  include httpd

  $opsview_db_password = hiera('opsview-server-password', 'password')
  $monitoring_ip = hiera('capmonitoring-ip-host')

  package { 'mysql':
    ensure => hiera('mysql-version', 'installed'),
  } ->

  package { 'mysql-server':
    ensure => hiera('mysql-server-version', 'installed'),
  } ->

  service {'mysqld':
    ensure => running,
  } ->

  exec { 'set-root-mysql-password':
    command => "mysqladmin -u root password ${opsview_db_password}",
    onlyif  => "mysql -u root -p'${opsview_db_password}' -e 'show databases;' 2>&1 | grep 'Access denied'",
  } ->

  exec { 'create-nagios-database':
    provider => shell,
    command  => "/usr/local/nagios/bin/db_mysql -u root -p ${opsview_db_password}",
    unless   => "mysql -u root -p'${opsview_db_password}' -e 'SELECT distinct User FROM mysql.user;' | grep 'opsview'",
  }
  ->

  exec { 'opsview-db-install':
    command  => '/usr/local/nagios/bin/db_opsview db_install',
    provider => shell,
    unless   => "mysql -u root -p'${opsview_db_password}' -e 'SELECT distinct name FROM opsview.monitoringservers' | grep 'Master Monitoring Server'",
  }
  ->

  exec { 'opsview-runtime-install':
    command  => '/usr/local/nagios/bin/db_runtime db_install',
    provider => shell,
    unless   => "mysql -u root -p'${opsview_db_password}' -e 'SELECT distinct name FROM runtime.opsview_hostgroups' | grep 'Opsview'",
  }
  ->

  file { '/var/log/opsview/opsviewd.log':
    owner   => 'nagios',
    group   => 'nagios',
    mode    => '0644',
  }
  ->

  exec { 'opsview-genconfig':
    command => '/usr/local/nagios/bin/rc.opsview gen_config',
  }
  ->

  file { '/etc/httpd/conf.d/':
    ensure => directory,
  }

  file {'/etc/httpd/conf/httpd.conf':
    content => template('opsview_server/httpd.conf.erb'),
    require => File['/etc/httpd/conf.d/'],
  }
  ->

  file {'/etc/httpd/conf.d/opsview.conf':
    content => template('opsview_server/opsview.conf.erb'),
    require => File['/etc/httpd/conf.d/'],
  }
  ->

  exec { 'add-apache-user-to-nagios':
    command => 'usermod -G nagcmd apache',
  }
  ->
  package { 'mime-types':
    ensure       => '1.25',
    provider     => gem,
  }
  ->
  package { 'json':
    ensure       => 'installed',
    provider     => gem,
  }
  ->
  package { 'rest-client':
    ensure       => 'installed',
    provider     => gem,
  }
  ->
  file {'/etc/puppet/opsview.conf':
    ensure  => present,
    replace => no,
    group   => 'root',
    mode    => '0750',
    content => template('opsview_server/etc/puppet/opsview.conf.erb'),
  }

  realize File['/etc/rsyslog.d/33-httpd.conf']

}
