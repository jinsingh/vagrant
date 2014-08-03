# Class defines an Upstart service and defines restart, start and stop commands
# as Puppet Upstart provider does not work properly on CentOS

class capdssui {

  include capdssui::package, capdssui::config, capdssui::service

  Class['capdssui::package'] -> Class['capdssui::config'] ~> Class['capdssui::service']

}
