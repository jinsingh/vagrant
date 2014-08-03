# == Class: capdmockidahub::config
#
# Class to install the CAPD Mock IDA Hub
#
# This is the configuration for the service which includes the following
#
# - Upstart service configuration
# - Required directories
# - Play app configuration
# - Rsyslog logging configuration
#
# === Parameters
#
# capd_mock_ida_hub_port - Port the play service will listen on
#
# === Variables
#
#
# === Examples
#
# include capdmockidahub
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdmockidahub::config{

  $capd_mock_ida_hub_port = hiera('capd-mock-ida-hub-port')
  $capd_external_web_address = hiera('capd-external-web-address')
  $ida_url = hiera('ida-url')
  $capd_ida_cert_path = '/opt/capd-mocks-play-ida-hub/etc/ida.crt'
  $capd_app_cert_path = '/opt/capd-mocks-play-ida-hub/etc/encryption.crt'
  $capd_private_signing_key_path = '/opt/capd-mocks-play-ida-hub/etc/encryption.pk8.der'
  $capd_encryption_private_key_path = $capd_private_signing_key_path
  $capd_app_cert_pem_content = hiera('capd-app-cert-pem-content')
  $capd_matching_service_private_key_pem_content = hiera('capd-matching-service-private-key-pem-content')
  $external_web_address = hiera('capd-external-web-address')

  file {'/etc/init/capdmockidahub.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('capdmockidahub/capdmockidahub-job.conf.erb'),
  }

  file { '/opt/capd-mocks-play-ida-hub':
    ensure => 'directory',
    owner  => 'root',
    group  => 'deploy',
    mode   => '0750',
  }

  file { '/opt/capd-mocks-play-ida-hub/etc':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    require => File['/opt/capd-mocks-play-ida-hub'],
  }

  file { $capd_ida_cert_path:
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => hiera('ida-crt-content'),
    require => File['/opt/capd-mocks-play-ida-hub/etc'],
  }

  file { $capd_app_cert_path:
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => hiera('rp-encryption-public-key-content'),
    require => File['/opt/capd-mocks-play-ida-hub/etc'],
  }

  file { $capd_private_signing_key_path:
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => hiera('rp-signing-private-pk8-key-content'),
    require => File['/opt/capd-mocks-play-ida-hub/etc'],
  }

  file {'/opt/capd-mocks-play-ida-hub/etc/capdmockidahub.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdmockidahub/capdmockidahub.conf.erb'),
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    file { '/etc/rsyslog.d/13-capdmockidahub.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdmockidahub/13-capdmockidahub.conf',
    }

  }

}
