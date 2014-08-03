# class sets up desired configuration for SMTP relay to work

class postfix::config {

  $management_ip = hiera('management-ip-host')
  $defra_capd_smtp_networks_allowed = hiera('defra-capd-smtp-networks-allowed', '127.0.0.1')
  $defra_capd_smtp_relay_name = hiera('defra-capd-smtp-relay-name')

  file { '/etc/postfix/':
    ensure  => directory,
  }->

  file { '/etc/postfix/main.cf':
      content => template('postfix/main.cf.erb'),
  }->

  file { '/etc/postfix/master.cf':
    content => template('postfix/master.cf.erb'),
  }

  file {
    '/etc/ssl/certs/ssl-cert-snakeoil.pem':
      ensure  => present,
      path    => '/etc/ssl/certs/ssl-cert-snakeoil.pem',
      require => Class['openssl'];
    '/etc/ssl/private/ssl-cert-snakeoil.key':
      ensure  => present,
      path    => '/etc/ssl/private/ssl-cert-snakeoil.key',
      require => Class['openssl'];
  }

# copy /etc/services to /var/spool/postfix/services
# somehow postfix package doesnt create necessary files so that it doesn't know where smtp service is
# and this has to be put in place

  file { 'create etc dir for postfix':
    ensure  => directory,
    path    => '/var/spool/postfix/etc',
    replace => no,
  }
  ->

  exec { 'copy services to postfix':
      command => 'cp /etc/services /var/spool/postfix/etc/services',
      path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
      creates => '/var/spool/postfix/etc/services',
  }
  ->

  exec { 'copy resolv.conf to postfix':
      command => 'cp /etc/resolv.conf /var/spool/postfix/etc/resolv.conf',
      path    => '/usr/bin:/usr/sbin:/bin:/usr/local/bin',
      creates => '/var/spool/postfix/etc/resolv.conf',
  }

}
