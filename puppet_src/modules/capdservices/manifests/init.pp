# Module which defines capdservices upstart job, config file and service refresh

class capdservices {

  include capdservices::package, capdservices::config, capdservices::service

  Class['capdservices::package'] -> Class['capdservices::config'] ~> Class['capdservices::service']

}
