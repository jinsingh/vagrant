# == Class: capdmatching
#
# CAPD matching module.  This module is here to install the
# CAPD matching service for IDA.
#
# === Examples
#
# include capdmatching
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdmatching::config {

  $caporacledb_hostname = hiera('caporacledb-hostname')
  $capd_oracle_username = hiera('capd-oracle-username')
  $capd_oracle_sid = hiera('capd-oracle-sid')
  $capd_oracle_capduser_password = hiera('capd-oracle-capduser-password')
  $capdmatching_port = hiera('capd-services-port')
  $capd_mock_ip = hiera('capabacomm-ip-host')
  $capd_web_ip = hiera('capweb-ip-host')
  $capd_mocks_proxy_address = hiera('capd-ha-virtual-ipaddress')
  $matching_service_url = hiera('matching-service-url', 'localhost:8700')
  $matching_service_adapter_url = hiera('matching-service-adapter-url', 'localhost:8700')
  $ida_hub_metadata_url = hiera('ida-hub-metadata-url', 'https://test-hub.reference.ida.digital.cabinet-office.gov.uk/SAML2/metadata/sp')
  $external_web_address = hiera('capd-external-web-address')

  file {'/etc/init/capdmatching.conf':
    ensure => present,
    owner  => 'root',
    group  => 'deploy',
    mode   => '0640',
    source => 'puppet:///modules/capdmatching/capdmatching-job.conf',
  }

  file { '/opt/capdmatching':
    ensure => 'directory',
    owner  => 'root',
    group  => 'deploy',
    mode   => '0750',
  }

  file {'/opt/capdmatching/matchingConfig.yml':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdmatching/matchingConfig.yml.erb'),
    require => File['/opt/capdmatching']
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {
    file { '/etc/rsyslog.d/15-capdmatching.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdmatching/15-capdmatching.conf',
    }
  }

}
