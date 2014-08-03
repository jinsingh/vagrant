# == Class: rsyslog::server
#
# This class configures rsyslog for a server role.
#
# === Parameters
#
# [*enable_tcp*]
# [*enable_udp*]
# [*enable_onefile*]
# [*server_dir*]
# [*custom_config*]
# [*high_precision_timestamps*]
#
# === Variables
#
# === Examples
#
#  Defaults
#
#  class { 'rsyslog::server': }
#
#  Create seperate directory per host
#
#  class { 'rsyslog::server':
#    custom_config => 'rsyslog/server-hostname.conf.erb'
#  }
#
class rsyslog::server (
  $enable_tcp                = true,
  $enable_udp                = true,
  $enable_onefile            = false,
  $server_dir                = '/srv/log/',
  $custom_config             = undef,
  $logaggregator_hostname = hiera('logaggregator-hostname'),
  $high_precision_timestamps = false
) inherits rsyslog {

  $real_content = $custom_config ? {
    ''      => template("${module_name}/server-default.conf.erb"),
    default => template($custom_config),
  }

  rsyslog::snippet {'server':
    ensure  => present,
    content => $real_content,
  }


  # rsyslog::snippet {'elasticsearch':
  #   ensure  => present,
  #   content => template("${module_name}/elasticsearch.conf.erb")
  # }

  # enable email capability
  $defra_capd_smtp_relay_name = hiera('defra-capd-smtp-relay-name')
  rsyslog::snippet {'alertemail':
    ensure  => present,
    content => template("${module_name}/alertemail.conf.erb")
  }
}
