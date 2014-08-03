# == Class: rsyslog::install
#
# This class makes sure that the required packages are installed
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'rsyslog::install': }
#
class rsyslog::install {

# Addind the official rsyslog RHEL repo to the newest version available

  if $::fqdn =~ /(\.test$)+/ {

    file { '/etc/yum.repos.d/rsyslog.repo':
      source  => 'puppet:///modules/rsyslog/rsyslog.repo',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      before  => [ Package['rsyslog'], Package['rsyslog-elasticsearch'] ],
    }
  }

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-Adiscon':
    source  => 'puppet:///modules/rsyslog/RPM-GPG-KEY-Adiscon',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  ->

  package { 'rsyslog':
    ensure => latest,
  }

  ->

  package { 'rsyslog-elasticsearch':
    ensure => latest,
  }

  if $rsyslog::relp_package_name != false {
    package { $rsyslog::relp_package_name:
      ensure => $rsyslog::package_status
    }
  }

}
