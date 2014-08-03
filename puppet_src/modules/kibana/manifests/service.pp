# Kibana service class
class kibana::service{

  service { 'httpd':
    ensure => running,
    enable => true,
  }

}