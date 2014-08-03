# Class to install base configuration for Tomcat to host application server
class tomcat {

  include tomcat::package, tomcat::config, tomcat::service

  Class['tomcat::package'] -> Class['tomcat::config'] ~> Class['tomcat::service']
}
