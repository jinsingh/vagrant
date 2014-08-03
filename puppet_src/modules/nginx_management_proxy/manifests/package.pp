# Class to make sure our custom nginx package is installed
# Also adds a dependency on repo class and libluajit
# Libluajit is required for nginx to start successfully

class nginx_management_proxy::package{

  package { 'nginx':
        ensure  => hiera('nginx-version', '1.4.2-1.el6.ngx'),
        notify  => Service['nginx']
  }

}
