# Class defines servicesConfig.yml config file for services, Mapfish and the
# capdsitiserviceintegrations upstart job and uses hiera lookups

class capdsitiserviceintegration::config {

  $external_web_address = hiera('capd-external-web-address')

  file {'/etc/init/capdsitiserviceintegration.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
    source => 'puppet:///modules/capdsitiserviceintegration/capdsitiserviceintegration-job.conf',
  }

  file {'/opt/capdsitiserviceintegration/mocksConfig.yml':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdsitiserviceintegration/mocksConfig.yml.erb'),
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    file { '/etc/rsyslog.d/11-capmocks.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdsitiserviceintegration/11-capmocks.conf',
    }

    include logrotate

    logrotate::file { 'mocks':
      log         => '/var/log/capd/capdmocks.log',
      options     => [ 'missingok', 'compress', 'daily', 'rotate 14' ],
      postrotate  => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
    }

  }

}
