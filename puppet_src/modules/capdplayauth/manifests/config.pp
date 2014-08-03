# config for capdplayauth

class capdplayauth::config{

  $play_auth_mail_from              = hiera('play-auth-mail-from')
  $play_auth_mail_name              = hiera('play-auth-mail-name')
  $management_box                   = hiera('capmanagement-hostname')
  $capd_play_auth_port              = hiera('capd-play-auth-port')
  $capd_auth_secure_auth_token_key  = hiera('capd-auth-secure-auth-token-key')
  $external_web_address             = hiera('capd-external-web-address')

  file {'/etc/init/capdplayauth.conf':
    ensure  => present,
    content => template('capdplayauth/capdplayauth-job.conf.erb'),
  }

  file { '/opt/capd-playauth':
    ensure => 'directory',
    owner  => 'root',
    group  => 'deploy',
    mode   => '0750',
  }

  file { '/opt/capd-playauth/etc':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    require => File['/opt/capd-playauth'],
  }

  file { '/opt/capd-playauth/etc/play-authenticate':
    ensure  => 'directory',
    owner   => 'root',
    group   => 'deploy',
    mode    => '0750',
    require => File['/opt/capd-playauth/etc'],
  }

  file {'/opt/capd-playauth/etc/capdplayauth.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdplayauth/capdplayauth.conf.erb'),
    require => File['/opt/capd-playauth/etc'],
  }

  file {'/opt/capd-playauth/etc/play-authenticate/deadbolt.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    source  => 'puppet:///modules/capdplayauth/deadbolt.conf',
    require => File['/opt/capd-playauth/etc/play-authenticate'],
  }

  file {'/opt/capd-playauth/etc/play-authenticate/smtp.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdplayauth/smtp.conf.erb'),
    require => File['/opt/capd-playauth/etc/play-authenticate'],
  }

  file {'/opt/capd-playauth/etc/play-authenticate/play-authenticate.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdplayauth/play-authenticate.conf.erb'),
    require => File['/opt/capd-playauth/etc/play-authenticate'],
  }

  file {'/opt/capd-playauth/etc/play-authenticate/play-easymail.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'deploy',
    mode    => '0640',
    content => template('capdplayauth/play-easymail.conf.erb'),
    require => File['/opt/capd-playauth/etc/play-authenticate'],
  }

  #rsyslog excluded from Atos PaaS
  if $external_web_address =~ /kainos/ {

    file { '/etc/rsyslog.d/12-capplayauth.conf':
      ensure => present,
      notify => Service['rsyslog'],
      source => 'puppet:///modules/capdplayauth/12-capplayauth.conf',
    }

  }

}
