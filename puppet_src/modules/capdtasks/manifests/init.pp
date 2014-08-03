# Module defines capd_db package, config file and execx
# this module is for loading data via CI

class capdtasks {

  include capdtasks::package, capdtasks::config

  Class['capdtasks::package'] -> Class['capdtasks::config']

}
