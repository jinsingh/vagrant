# Ensures that httpd is running
class yumrepo::service {

  service { 'httpd' :
    ensure     => running,
    enable     => true,
    name       => 'httpd',
    hasstatus  => true,
    hasrestart => true,
  }

}
