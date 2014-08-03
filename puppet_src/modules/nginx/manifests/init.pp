# This is the nginx module here to install, configure and run nginx.

class nginx {

  include repo

  include libluajit

  include nginx::package, nginx::service, nginx::config

  Class['repo'] -> Class['libluajit'] -> Class['nginx::package']

  Class['nginx::package'] -> Class['nginx::config'] ~> Class['nginx::service']

}
