# memcached module
# used to provide memcached package to a node
# it's used to cache web request of anytype
# to reduce the backend load
# =============================================

class memcached {

include memcached::package, memcached::config, memcached::service

  Class['memcached::package'] -> Class['memcached::config'] ~> Class['memcached::service']

}
