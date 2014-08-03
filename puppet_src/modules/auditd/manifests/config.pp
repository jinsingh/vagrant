# Ensure the config for the auditd is in place
class auditd::config {

  file { '/etc/audit/auditd.conf':
    content => template('auditd/auditd.conf.erb'),
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
  }

  file { '/etc/audit/audit.rules':
    content => template('auditd/audit.rules.erb'),
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
  }

  file { '/etc/audisp/plugins.d/syslog.conf':
    content => template('auditd/audisp-syslog.conf.erb'),
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
  }

  file { '/etc/rsyslog.d/18-auditd.conf':
    ensure => present,
    notify => Service['rsyslog'],
    source => 'puppet:///modules/auditd/18-auditd.conf',
  }

  include logrotate

  logrotate::file { 'auditd':
    log        => '/var/log/audit/audit.log',
    options    => [ 'notifempty', 'daily', 'rotate 14' ],
    postrotate => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
  }
}
