# = Class: kibana
#
# This class installs and manages kibana
#
class kibana {

include kibana::package, kibana::webserver, kibana::service

  Class['kibana::package'] -> Class['kibana::webserver'] ~> Class['kibana::service']

}
