# Base node class to be used by all nodes.
#
class nodes::s_base {
  include unzip
  include wget
  include hosts
  include deploy
  include openssl
  include repo
  include defra_fw
  include arrays::servers

  $external_web_address = hiera('capd-external-web-address')

  if $external_web_address =~ /kainos/ {
    include auditd
    include software_updates
    include rsyslog
    include rsyslog::client
    include hardening
    include rackconnect
    include sshd
    include users
    include rkhunter
    include fail2ban
    include swap_file
    include epel
    $ntp_servers = hiera('ntp-servers')

    class { '::ntp':
      servers => $ntp_servers
    }
    package { 'hiera-eyaml':
      ensure   => '2.0.2',
      provider => gem,
    }

    package { 'bash-completion':
      ensure  => installed,
    }
  }

}
