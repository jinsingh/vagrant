# this class creates webserver that will serve Kibana dashboard
#
#
class kibana::webserver{
  include httpd

  realize File['/etc/rsyslog.d/33-httpd.conf']

  $kibana_ext_ip = hiera('logaggregator-ip-ext')
  $kibana_serv_name = hiera('logaggregator-hostname')

  # these 2 packages could be moved to new module httpd:
  package { 'httpd':
    ensure => hiera('httpd-version', 'latest'),
  }
  ->
  package { 'mod_ssl':
    ensure  => hiera('mod-ssl-version', 'latest'),
    #require => Package['httpd']
  }
  ->
  # To begin with, we need to generate server keys; we create this using the temporary passphrase 'testpass'
  # but we then remove passphrase protection to leave us with a unprotected server key.
  exec {'Generate httpd key' :
    command  => '/usr/bin/openssl genrsa -des3 -passout pass:password -out /opt/kibana/ssl.key 1024; cp /opt/kibana/ssl.key /opt/kibana/ssl.key.orig; /usr/bin/openssl rsa -passin pass:password -in /opt/kibana/ssl.key.orig -out /opt/kibana/ssl.key; rm -f /opt/kibana/ssl.key.orig',
    creates  => '/opt/kibana/ssl.key',
  }
  ->
  # We generate a wildcard certificate request for the domain *.ertp.alphagov.co.uk although this does not really matter as the certificates are self-signed they will produce
  # verification errors long before they reach CN validation.
  exec {'Generate CSR' :
    command  => "/usr/bin/openssl req -new -subj \"/C=GB/ST=Herts/L=London/O=IT/CN=*.${::domain}\" -key /opt/kibana/ssl.key -out /opt/kibana/ssl.csr",
    creates  => '/opt/kibana/ssl.crt',
  }
  ->
  # We then sign the certificate request.  All of the certificate files are saved in the /etc/nginx/ssl folder.
  exec {'Sign certificate' :
    command  => '/usr/bin/openssl x509 -req -days 365 -in /opt/kibana/ssl.csr -signkey /opt/kibana/ssl.key -out /opt/kibana/ssl.crt',
    creates  => '/opt/kibana/ssl.crt',
  }
  # ->
  # file { '/etc/httpd/conf.d/httpd-es-kibana.conf':
  #   ensure  => file,
  #   content => template('kibana/httpd-es-kibana.conf.erb'),
  #   #require => Package['mod_ssl'],
  # }
  ->
  file { '/etc/httpd/conf/httpd.conf':
    ensure  => file,
    content => template('kibana/httpd.conf.erb'),
  }

  file { '/var/www/users':
    ensure => present,
    source => 'puppet:///modules/kibana/users',
    owner  => 'apache',
    mode   => 0400,
  }
  

}
