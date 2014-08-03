# Module serving Play-Authentication bit
#
class capdplayauth{

include capdplayauth::package, capdplayauth::config, capdplayauth::service

  Class['capdplayauth::package'] -> Class['capdplayauth::config'] ~> Class['capdplayauth::service']

}
