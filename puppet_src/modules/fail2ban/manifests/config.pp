# this is configuration class for fail2ban

class fail2ban::config {

$capd_securityalert_notification = hiera('capd-securityalert-notification')

  file { '/etc/fail2ban/fail2ban.conf':
    ensure  => file,
    content => template('fail2ban/etc/fail2ban/fail2ban.conf.erb'),
  }

  file { '/etc/fail2ban/jail.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('fail2ban/etc/fail2ban/jail.conf.erb'),
  }

  file {'/etc/fail2ban/action.d/mail-whois-lines.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('fail2ban/etc/fail2ban/action.d/mail-whois-lines.conf.erb'),
  }

  file {'/etc/fail2ban/action.d/sendmail-whois-lines.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('fail2ban/etc/fail2ban/action.d/sendmail-whois-lines.conf.erb'),
  }

  cron {'fail2ban':
    ensure  => present,
    user    => 'root',
    minute  => [0],
    hour    => '11',
    command => "/sbin/service fail2ban status ; [ ! $? -eq \"0\" ] && echo Service fail2ban is not running on ${::fqdn} | mail -s \"CAPD Fail2ban Service check\" ${capd_securityalert_notification}",
    require => Package['fail2ban'],
  }

  file { '/etc/rsyslog.d/21-fail2ban.conf':
    ensure => present,
    notify => Service['rsyslog'],
    source => 'puppet:///modules/fail2ban/21-fail2ban.conf',
  }
  
  include logrotate

  logrotate::file { 'fail2ban':
    log        => '/var/log/fail2ban.log',
    options    => [ 'notifempty', 'daily', 'rotate 14' ],
    postrotate => '/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true',
  }
}
