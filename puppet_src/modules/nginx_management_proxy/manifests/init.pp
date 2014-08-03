# This is the nginx module here to install, configure and run nginx.

class nginx_management_proxy {

  include repo

  include libluajit

  include nginx_management_proxy::package, nginx_management_proxy::service, nginx_management_proxy::config

  Class['repo'] -> Class['nginx_management_proxy::package']

  Class['nginx_management_proxy::package'] -> Class['nginx_management_proxy::config'] ~> Class['nginx_management_proxy::service']

}
