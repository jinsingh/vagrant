# Class to deploy the Siti Agri WAR files to the Tomcat app servers.
class capapp {

  include capapp::package, capapp::config, capapp::deploy

  Class['capapp::package'] -> Class['capapp::config'] -> Class['capapp::deploy']

}
