# == Module: haproxy
#
# Module set up for high availability proxy (HAProxy)
#
# === Parameters
#
# === Variables
#
# === Examples
#
# === Authors
# Ops
# === Copyright
#
# DEFRA

class haproxy {

# we have to include the arrays module to pull in the definitions of server groups
  include arrays::servers

  case $::osfamily {

    'RedHat': {
      
      $external_web_address = hiera('capd-external-web-address')
      
      package {'haproxy':
        ensure  => hiera('haproxy-version', '1.5-dev22.1'),
        require => Class['repo'],
        notify  => Service['haproxy'],
      }

      file {'/etc/haproxy/haproxy.cfg':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0640',
        content => template('haproxy/haproxy.cfg.erb'),
        require => Package['haproxy'],
      }

      #rsyslog excluded from Atos PaaS
      if $external_web_address =~ /kainos/ {

        file {'/etc/rsyslog.d/28-ha_proxy.conf':
          ensure => present,
          source => 'puppet:///modules/haproxy/28-ha_proxy.conf',
        }

        include logrotate

        logrotate::file { 'haproxy':
          log         => '/var/log/capd/haproxy.log',
          options     => [ 'missingok', 'compress', 'daily', 'rotate 14' ],
          postrotate  => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
        }
      
      }

      service { 'haproxy':
        ensure    => running,
        enable    => true,
        subscribe => File['/etc/haproxy/haproxy.cfg'],
        require   => File['/etc/haproxy/haproxy.cfg'],
      }
    }
    'Darwin': {
      file {'/etc/haproxy/haproxy.cfg':
        ensure  => present,
        content => template('haproxy/haproxy.cfg.erb'),
      } ->

      exec {'create-haproxy-user':
        provider => shell,
        command  => 'sudo dscl . create /Groups/haproxy PrimaryGroupID 499
                     sudo dscl . create /Users/haproxy UniqueID 499
                     sudo dscl . create /Users/haproxy PrimaryGroupID 499
                     sudo dscl . create /Users/haproxy UserShell /bin/false
                     sudo dscl . create /Users/haproxy RealName haproxy
                     sudo dscl . create /Users/haproxy NFSHomeDirectory /usr/local/var/run/haproxy
                     sudo dscl . create /Groups/haproxy GroupMembership haproxy',
        unless   => 'dscl . list /Users | grep -v ^_.* | grep haproxy',
      }
    }
  }



}
