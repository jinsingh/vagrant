# == Class: capdsendmail
#
# CAPD sendmail module.  This module is here to install the
# CAPD sendmail service for IDA.
#
# === Parameters
#
#
# === Variables
#
#
# === Examples
#
# include capdsendmail
#
# === Authors
#
# CAPD OPS
#
# === Copyright
#
# GDS
#

class capdsendmail::config {

  $capd_send_mail_port = hiera('capd-send-mail-port')
  $capd_send_mail_admin_port = hiera('capd-send-mail-admin-port')
  $capmanagement_hostname = hiera('capmanagement-hostname')
  $capd_send_mail_from = hiera('capd-send-mail-from')
  $capd_send_mail_to = hiera('capd-send-mail-to')
  $capd_send_mail_health_check_email_address = hiera('capd-send-mail-health-check-email-address', 'DEFRA-HealthServiceCheck@kainos.com')
  $external_web_address = hiera('capd-external-web-address')

  file {'/etc/init/capdsendmail.conf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
    source => 'puppet:///modules/capdsendmail/capdsendmail-job.conf',
  }

  file { '/opt/capdsendmail':
    ensure => 'directory',
    owner  => 'root',
    group  => 'deploy',
    mode   => '0750',
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    file { '/etc/rsyslog.d/17-capdsendmail.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdsendmail/17-capdsendmail.conf',
    }

  }

  file { '/opt/capdsendmail/sendEmailServiceConfiguration.yml':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    notify  => Service['capdsendmail'],
    content => template('capdsendmail/sendEmailServiceConfiguration.yml'),
    require => File['/opt/capdsendmail'],

  }

}

