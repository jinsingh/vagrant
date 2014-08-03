# Class defines capdweeb.conf config file for Play application and
# capdssui upstart job. Config file uses hiera lookups

class capdssui::config {

  $management_box = hiera('capmanagement-hostname')
  $defra_analytics_accountNumber = hiera ('defra-analytics-accountNumber')
  $capd_external_address = hiera ('capd-external-web-address')
  $capd_ha_virtual_ipaddress = hiera ('capd-ha-virtual-ipaddress')
  $capd_services_port = hiera('capd-services-port')
  $external_web_address = hiera('capd-external-web-address')

  file { '/opt/capd-ssui/etc':
    ensure => 'directory',
    owner  => 'root',
    group  => 'deploy',
    mode   => '0750',
  }

  file {'/opt/capd-ssui/etc/capdssui.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdssui/capdssui.conf.erb'),
    require => File['/opt/capd-ssui/etc'],
  }

  file { '/opt/capd-ssui/etc/mapping.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdssui/mapping.conf.erb'),
    require => File['/opt/capd-ssui/etc'],
  }

  file { '/opt/capd-ssui/etc/analytics.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdssui/analytics.conf.erb'),
    require => File['/opt/capd-ssui/etc'],
  }

  file {'/opt/capd-ssui/etc/deadbolt.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    source  => 'puppet:///modules/capdssui/deadbolt.conf',
    require => File['/opt/capd-ssui/etc'],
  }

  file {'/opt/capd-ssui/etc/smtp.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdssui/smtp.conf.erb'),
    require => File['/opt/capd-ssui/etc'],
  }

  file {'/opt/capd-ssui/etc/play-easymail.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdssui/play-easymail.conf.erb'),
    require => File['/opt/capd-ssui/etc'],
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    file { '/etc/rsyslog.d/16-capdssui.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdssui/16-capdssui.conf',
    }

  }

  file {'/etc/init/capdssui.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
    source => 'puppet:///modules/capdssui/capdssui-job.conf',
  }


}
