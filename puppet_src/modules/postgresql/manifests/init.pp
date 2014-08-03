# Module defines the postgresql repo, installs postgresql, initialises the database,
# and defines the postgresql config using hiera variables

class postgresql {

  include postgresql::repo, postgresql::package, postgresql::initdb, postgresql::config, postgresql::service

  Class['postgresql::repo'] -> Class['postgresql::package'] -> Class['postgresql::initdb'] -> Class['postgresql::config'] ~> Class['postgresql::service']

}
