# class configures capdb package
class capddata::config {

  $caporacledb_ip_host = hiera('caporacledb-ip-host')
  $capd_oracle_starter_globaldb_name = hiera('capd-oracle-starter-globaldb-name')
  $capd_oracle_sid = hiera('capd-oracle-sid')
  $capd_oracle_username = hiera('capd-oracle-username')
  $capd_oracle_capduser_password = hiera('capd-oracle-capduser-password')
  $capd_oracle_system_user = hiera('capd-oracle-sys-username')
  $capd_oracle_auth_globaldb_name = hiera('capd-oracle-auth-globaldb-name')
  $capd_oracle_auth_sid = hiera('capd-oracle-auth-sid')
  $capd_oracle_authusername = hiera('capd-oracle-auth-username')
  $capd_oracle_authuser_password = hiera('capd-oracle-authuser-password')
  $external_web_address = hiera('capd-external-web-address')


  file { '/opt/capddata':
    ensure => 'directory',
    owner  => root,
    group  => deploy,
    mode   => '0750',
  }

  file { '/opt/capddata/capddata.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/opt/capddata'],
    content => template('capddata/capddata.properties.erb'),
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    file { '/etc/rsyslog.d/26-capddata.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capddata/26-capddata.conf',
    }

    include logrotate

    logrotate::file { 'capddata':
      log        => '/var/log/capd/capddata.log',
      options    => [ 'notifempty', 'daily', 'rotate 14' ],
      postrotate => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    }
  }

  exec {'capd_db_update':
    refreshonly => true,
    path        => '/usr/bin:/usr/sbin:/bin:/sbin',
    command     => 'bash -c "java -jar -Djob.properties=/opt/capddata/capddata.properties /opt/capddata/cap-db-assembly.jar 2>&1 | tee >(logger -t CAPDDATA -p daemon.info)"',
  }

  exec {'capd_auth_db_update':
    refreshonly => true,
    path        => '/usr/bin:/usr/sbin:/bin:/sbin',
    command     => 'bash -c "java -jar -Djob.properties=/opt/capddata/capddata.properties /opt/capdinternaluserauthservices/capd-db-assembly-internet-user-auth.jar 2>&1 | tee >(logger -t CAPDDATA -p daemon.info)"',
  }

}
