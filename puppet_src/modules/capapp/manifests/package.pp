# Class to deploy the Siti Agri WAR files to the Tomcat app servers.
class capapp::package {

  package { 'capd-siti-tomcat':
    ensure   => hiera('siti-tomcat-version', 'latest'),
    notify   => Service['tomcat6'],
    require  => Class['repo'],
  }

  file { '/usr/share/java/tomcat6/ojdbc6.jar':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/capapp/ojdbc6.jar',
  }

}
