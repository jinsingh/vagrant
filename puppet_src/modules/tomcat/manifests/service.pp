# Start Tomcat service once configuration in place
class tomcat::service {

  service { 'tomcat6' :
    ensure     => running,
    enable     => true,
    name       => 'tomcat6',
    hasstatus  => true,
    hasrestart => true,
  }

}
