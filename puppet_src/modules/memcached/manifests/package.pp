# package class for memcached

class memcached::package {

  package { 'memcached':
    ensure  => hiera('memcached-version', 'latest'),
    require => Class['repo'],
    notify  => Service['memcached'],
  }

}
