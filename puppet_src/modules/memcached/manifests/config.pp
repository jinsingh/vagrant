# config file for memcached

class memcached::config {

$max_cache = hiera('capd-memcached-max-cache')
$port = hiera('capd-memcached-port')
$username = hiera('capd-memcached-username')

# below is used to define how much memory to allocate for caching
# value to be provided in MB, default value is 64 MB

ini_setting { 'max memory':
    ensure  => present,
    path    => '/etc/sysconfig/memcached',
    section => '',
    setting => 'CACHESIZE',
    value   => $max_cache,
  }

# set port on which to listen for connections, default value is 11211

ini_setting { 'port':
    ensure  => present,
    path    => '/etc/sysconfig/memcached',
    section => '',
    setting => 'PORT',
    value   => $port,
  }

# set username to use by clients, default value is memcached

ini_setting { 'username':
    ensure  => present,
    path    => '/etc/sysconfig/memcached',
    section => '',
    setting => 'USER',
    value   => $username,
  }

# define maximum concurring connections, default value is 1024

ini_setting { 'max connection limit':
    ensure  => present,
    path    => '/etc/sysconfig/memcached',
    section => '',
    setting => 'MAXCONN',
    value   => '1024',
  }

user { 'memcached':
    ensure  => present,
}

}