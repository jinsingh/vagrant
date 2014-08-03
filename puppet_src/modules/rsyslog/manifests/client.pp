# == Class: rsyslog::client
#
# Full description of class role here.
#
# === Parameters
#
# [*sample_parameter*]
# [*log_remote*]
# [*spool_size*]
# [*remote_type*]
# [*log_local*]
# [*log_auth_local*]
# [*custom_config*]
# [*custom_params*]
# [*server*]
# [*port*]
#
# === Variables
#
# === Examples
#
#  class { 'rsyslog::client': }
#
class rsyslog::client (
  $log_remote     = true,
  $spool_size     = '1g',
  $remote_type    = 'tcp',
  $log_local      = true,
  $log_auth_local = false,
  $custom_config  = undef,
  $custom_params  = undef,
  $server         = hiera('logaggregator-hostname'),
  $port           = '514'
) inherits rsyslog {

  $logserver = hiera('logaggregator-hostname')

  $content_real = $custom_config ? {
    ''      => template("${module_name}/client.conf.erb"),
    default => template($custom_config),
  }

  case $node_type {
      'nodes::s_logaggregator': {

       }
      default:               {
        rsyslog::snippet {'client':
          ensure  => present,
          content => $content_real,
        }
      } # that makes other nodes to accept ssh only from management.
    }

}
