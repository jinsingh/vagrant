# Module which defines capdauth upstart job, config file and service refresh

class capdauth {

  include capdauth::package, capdauth::config, capdauth::service

  Class['capdauth::package'] -> Class['capdauth::config'] ~> Class['capdauth::service']

}
