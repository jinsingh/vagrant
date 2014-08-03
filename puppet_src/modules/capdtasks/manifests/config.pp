# class for configuring data load via CI

class capdtasks::config {


  $webservice_hostname = hiera('capd-external-web-address')
  $caporacledb_ip_host = hiera('caporacledb-ip-host')
  $capabacocomm_ip_host = hiera('capabacomm-ip-host')
  $capd_oracle_sid = hiera('capd-oracle-sid')
  $capd_oracle_password_system = hiera('capd-oracle-password-system')
  $capd_oracle_sys_username = hiera('capd-oracle-sys-username')
  $external_web_address = hiera('capd-external-web-address')

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    file { '/etc/rsyslog.d/22-capdtasks.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdtasks/22-capdtasks.conf',
    }

    include logrotate

    logrotate::file { 'capdtasks':
      log        => '/var/log/capd/capdtasks.log',
      options    => [ 'notifempty', 'daily', 'rotate 14' ],
      postrotate => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    }
  
  }

  file {'/opt/capdtasks/passcodeOnlyLoad.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/passcodeOnlyLoad.properties.erb'),
    require => Package['capdtasks']
  }

  file {'/opt/capdtasks/csvLoad.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/csvLoad.properties.erb'),
    require => Package['capdtasks']
  }

  file {'/opt/capdtasks/acceptanceLoad.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/acceptanceLoad.properties.erb'),
    require => Package['capdtasks']
  }

  file {'/opt/capdtasks/userOnlyLoad.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/userOnlyLoad.properties.erb'),
    require => Package['capdtasks']
  }

  file {'/opt/capdtasks/perfLoad1.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/perfLoad1.properties.erb'),
    require => Package['capdtasks']
  }

  file {'/opt/capdtasks/perfLoad2.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/perfLoad2.properties.erb'),
    require => Package['capdtasks']
  }

  file {'/opt/capdtasks/perfLoad3.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/perfLoad3.properties.erb'),
    require => Package['capdtasks']
  }

  file {'/opt/capdtasks/perfLoad4.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/perfLoad4.properties.erb'),
    require => Package['capdtasks']
  }

  file {'/opt/capdtasks/perfLoad5.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/perfLoad5.properties.erb'),
    require => Package['capdtasks']
  }

  file {'/opt/capdtasks/perfLoad6.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/perfLoad6.properties.erb'),
    require => Package['capdtasks']
  }

  file {'/opt/capdtasks/perfLoad7.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/perfLoad7.properties.erb'),
    require => Package['capdtasks']
  }

  file {'/opt/capdtasks/perfLoad8.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/perfLoad8.properties.erb'),
    require => Package['capdtasks']
  }

  file { '/opt/capdtasks/output/':
    ensure => directory,
    mode   => '0755',
    owner  => deploy,
    group  => deploy,
  }

  file { '/opt/capdtasks/connection.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdtasks/connection.properties.erb'),
  }

}
