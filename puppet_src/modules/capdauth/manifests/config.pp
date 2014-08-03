# Class defines servicesConfig.yml config file for services, Mapfish and the
# capdservicess upstart job and uses hiera lookups

class capdauth::config {

  $capd_auth_port = hiera('capd-auth-port')
  $capd_auth_admin_port = hiera('capd-auth-admin-port')
  $external_web_address = hiera('capd-external-web-address')

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {
    file { '/etc/rsyslog.d/10-capauth.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdauth/10-capauth.conf',
    }
  }

  file {'/etc/init/capdauth.conf':
    ensure => present,
    source => 'puppet:///modules/capdauth/capdauth-job.conf',
  }

  file { '/opt/capdauth':
    ensure => 'directory',
  }

  file {'/opt/capdauth/authConfig.yml':
    ensure  => present,
    content => template('capdauth/authConfig.yml.erb'),
    require => File['/opt/capdauth'],
    notify  => Service['capdauth'],
  }

}
