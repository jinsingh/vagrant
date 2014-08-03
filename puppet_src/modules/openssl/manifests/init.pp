# Class to have OpenSSL in place for securing communications
# like from postfix

class openssl {

  package { 'openssl' :
    ensure => hiera('openssl-package-version','latest')
  }

# this is to generate self-signed keys for SSL connections for email

  file{ '/etc/ssl/private':
    ensure => 'directory',
    owner  => 'root',
    mode   => '0755'
  }

# probably can be done better but it has to be this way for now. Piotr.
  exec { 'openssl req -new -nodes -x509 -out /etc/ssl/certs/ssl-cert-snakeoil.pem -keyout /etc/ssl/private/ssl-cert-snakeoil.key -days 3650 -subj \'/C=UK/CN=rpa.local\'':
    cwd     => '/var/tmp',
    creates => '/etc/ssl/certs/ssl-cert-snakeoil.pem',
    path    => ['/usr/bin', '/usr/sbin'],
    # notify => Service['postfix::service::postfix'],
  }

}
