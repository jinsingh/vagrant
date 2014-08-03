# Class defines servicesConfig.yml config file for services, Mapfish and the
# capdservicess upstart job and uses hiera lookups

class capdservices::config {

# we have to include the arrays module to pull in the definitions of server groups
  include arrays::servers

$caporacledb_hostname               = hiera('caporacledb-hostname')
$capd_oracle_username               = hiera('capd-oracle-username')
$capd_oracle_sid                    = hiera('capd-oracle-sid')
$capd_oracle_capduser_password      = hiera('capd-oracle-capduser-password')
$capdservices_port                  = hiera('capd-services-port')
$capd_mock_ip                       = hiera('capabacomm-ip-host')
$capd_web_ip                        = hiera('capweb-ip-host')
$capd_proxy_ip                      = hiera('capd-ha-virtual-ipaddress', $capd_web_ip)
$management_ip                      = hiera('management-ip-host')
$capd_ida_cert_path                 = hiera('capd-ida-cert-path')
$capd_app_cert_path                 = hiera('capd-app-cert-path')
$capd_private_signing_key_path      = hiera('capd-private-signing-key-path')
$capd_private_encryption_key_path   = hiera('capd-private-encryption-key-path')
$ida_url                            = hiera('ida-url')
$capd_external_web_address          = hiera('capd-external-web-address')
$enable_organisation_amend          = hiera('capd-services-organisation-amend')
$enable_organisation_create         = hiera('capd-services-organisation-create')
$enable_parcel_add                  = hiera('capd-services-parcel-add', false)
$enable_parcel_remove               = hiera('capd-services-parcel-remove', false)
$capd_auth_secure_auth_token_key    = hiera('capd-auth-secure-auth-token-key')
$ida_token_service_url              = hiera('ida-token-service-url')
$ida_restrict_access_based_on_token = hiera('ida-restrict-access-based-on-token')
$ida_sso_post_url                   = hiera('ida-sso-post-url')
$external_web_address               = hiera('capd-external-web-address')


  file {'/etc/init/capdservices.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
    source => 'puppet:///modules/capdservices/capdservices-job.conf',
  }

  file { '/opt/capdservices':
    ensure => 'directory',
    owner  => 'root',
    group  => 'deploy',
    mode   => '0750',
  }

  file {'/opt/capdservices/servicesConfig.yml':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdservices/servicesConfig.yml.erb'),
    require => File['/opt/capdservices']
  }

  file {'/opt/capdservices/ida.crt':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => hiera('ida-crt-content'),
    require => File['/opt/capdservices']
  }

  file {'/opt/capdservices/encryption.crt':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => hiera('rp-encryption-public-key-content'),
    require => File['/opt/capdservices']
  }

  file {'/opt/capdservices/signing.crt':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => hiera('rp-signing-public-key-content'),
    require => File['/opt/capdservices']
  }

  file {'/opt/capdservices/signing.pk8.der':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => hiera('rp-signing-private-pk8-key-content'),
    require => File['/opt/capdservices']
  }

  file {'/opt/capdservices/encryption.pk8.der':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => hiera('rp-encryption-private-pk8-key-content'),
    require => File['/opt/capdservices']
  }

  file {'/opt/capdservices/publicSigningKey.crt':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => hiera('msa-signing-public-key-content'),
    require => File['/opt/capdservices']
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    file { '/etc/rsyslog.d/14-capdservices.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdservices/14-capdservices.conf',
    }

    include logrotate

    logrotate::file { 'capdservices':
      log        => '/var/log/capd/capdservices.log',
      options    => [ 'notifempty', 'daily', 'rotate 14' ],
      postrotate => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    }

  }

}
