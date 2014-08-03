# Module which defines capdsitiserviceintegration upstart job, config file and service refresh

class capdsitiserviceintegration {

  include capdsitiserviceintegration::package, capdsitiserviceintegration::config, capdsitiserviceintegration::service

  Class['capdsitiserviceintegration::package'] -> Class['capdsitiserviceintegration::config'] ~> Class['capdsitiserviceintegration::service']

}
