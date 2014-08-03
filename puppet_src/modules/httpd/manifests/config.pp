# Configuration class for httpd

class httpd::config {
  include logrotate
  include rsyslog

  file { '/etc/rsyslog.d/33-httpd.conf':
    ensure => present,
    notify => Service['rsyslog'],
    source => 'puppet:///modules/httpd/33-httpd.conf',
  }

  logrotate::file { 'httpd':
    log        => '/var/log/httpd/*log',
    options    => [ 'missingok',
                    'notifempty',
                    'weekly',
                    'sharedscripts',
                    'delaycompress',
                    'rotate 14',
                  ],
    postrotate => ['/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
                  '/sbin/service httpd reload > /dev/null 2>/dev/null || true',
                  ],
  }
}
