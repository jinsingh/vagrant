# == Class: capdmatchingadapter::config
#
# CAPD matching module.  This module is here to install the
# CAPD matching service for IDA.
#
# === Examples
#
# include capdmatchingadapter
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#
class capdmatchingadapter::config {

  $capd_msa_private_signing_key_uri     = hiera('capd-msa-private-signing-key-uri', 'keys/privateSigningKey.pk8.der')
  $capd_msa_public_signing_key_uri      = hiera('capd-msa-public-signing-key-uri', 'keys/publicSigningKey.crt')
  $capd_msa_public_signing_key_name     = hiera('capd-msa-public-signing-key-name', 'rpa.gov.uk')
  $capd_msa_private_encryption_key_uri  = hiera('capd-msa-private-encryption-key-uri', 'keys/privateEncryptionKey.pk8.der')
  $capd_msa_public_encryption_key_uri   = hiera('capd-msa-public-encryption-key-uri', 'keys/publicEncryptionKey.crt')
  $capd_msa_public_encryption_key_name  = hiera('capd-msa-public-encryption-key-name', 'rpa.gov.uk')
  $ida_truststore_uri                   = hiera('ida-truststore-uri', 'ida_truststore.ts')
  $matching_adapter_port                = hiera('capd-matching-adapter-port')
  $matching_adapter_admin_port          = hiera('capd-matching-admin-adapter-port')
  $ida_hub_metadata_url                 = hiera('ida-hub-metadata-url', 'https://test-hub.reference.ida.digital.cabinet-office.gov.uk/SAML2/metadata/sp')

  $matching_service_adapter_url         = hiera('matching-service-adapter-url')
  $matching_service_url                 = hiera('matching-service-url', 'http://locahost:8700')

  $external_web_address = hiera('capd-external-web-address')

  file { '/opt/capdmatchingadapter':
    ensure => 'directory',
    owner  => 'root',
    group  => 'deploy',
    mode   => '0750',
  }

  file { '/opt/capdmatchingadapter/keys':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    require => File['/opt/capdmatchingadapter']
  }

  file { '/opt/capdmatchingadapter/ida_truststore.ts':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    notify  => Service['capdmatchingadapter'],
    require => File['/opt/capdmatchingadapter'],
    source  => 'puppet:///modules/capdmatchingadapter/ida_truststore.ts',
  }

  file {'/opt/capdmatchingadapter/adapterConfig.yml':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    notify  => Service['capdmatchingadapter'],
    content => template('capdmatchingadapter/adapterConfig.yml.erb'),
    require => File['/opt/capdmatchingadapter']
  }

  file {'/opt/capdmatchingadapter/keys/privateSigningKey.pk8.der':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    notify  => Service['capdmatchingadapter'],
    content => hiera('msa-signing-private-pk8-key-content'),
    require => File['/opt/capdmatchingadapter']
  }

  file {'/opt/capdmatchingadapter/keys/publicSigningKey.crt':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    notify  => Service['capdmatchingadapter'],
    content => hiera('msa-signing-public-key-content'),
    require => File['/opt/capdmatchingadapter/keys']
  }

  file {'/opt/capdmatchingadapter/keys/publicEncryptionKey.crt':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    notify  => Service['capdmatchingadapter'],
    content => hiera('msa-encryption-public-key-content'),
    require => File['/opt/capdmatchingadapter/keys']
  }

  file {'/opt/capdmatchingadapter/keys/privateEncryptionKey.pk8.der':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    notify  => Service['capdmatchingadapter'],
    content => hiera('msa-encryption-private-pk8-key-content'),
    require => File['/opt/capdmatchingadapter/keys']
  }

  if $::fqdn == 'capservices.rpa.integration' {
    file {'/etc/init/capdmatchingadapter.conf':
      ensure => present,
      notify => Service['capdmatchingadapter'],
      source => 'puppet:///modules/capdmatchingadapter/capdmatchingadapter-job-integration.conf',
    }
  } else {
      file {'/etc/init/capdmatchingadapter.conf':
      ensure => present,
      notify => Service['capdmatchingadapter'],
      source => 'puppet:///modules/capdmatchingadapter/capdmatchingadapter-job.conf',
    }
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    file { '/etc/rsyslog.d/27-capdmatchingadapter.conf':
      ensure => present,
      owner  => 'root',
      group  => 'deploy',
      mode   => '0640',
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdmatchingadapter/27-capdmatchingadapter.conf',
    }

  }

  if $external_web_address == 'capinformation.mff.gb.net' {
    file { '/opt/capdmatchingadapter/metadata.xml':
      ensure => present,
      owner  => 'root',
      group  => 'deploy',
      mode   => '0640',
      notify => Service['capdmatchingadapter'],
      source => 'puppet:///modules/capdmatchingadapter/metadata.xml.prod',
    }
  }

  if $external_web_address == 'capd-testing.kainos.com' or $external_web_address == 'capd-demo.kainos.com' or $external_web_address == 'capd-release.kainos.com' {
    file { '/opt/capdmatchingadapter/metadata.xml':
      ensure => present,
      owner  => 'root',
      group  => 'deploy',
      mode   => '0640',
      notify => Service['capdmatchingadapter'],
      source => 'puppet:///modules/capdmatchingadapter/metadata.xml.dev',
    }
  }

}
