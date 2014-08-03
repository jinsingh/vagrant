# Modue for creation of yum repository for rpm packages
# of puppet and other components

class yumrepo {

  include yumrepo::package, yumrepo::config, yumrepo::service

  Class['yumrepo::package'] -> Class['yumrepo::config'] ~> Class['yumrepo::service']

}
