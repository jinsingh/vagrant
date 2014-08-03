# Class defines base nginx.conf file, conf.d directory (included
# in base nginx.conf file. Also defines access.lua file which
# is referenced in nginx-lua.conf file
# Also temporary basic auth - to be removed later.

class nginx_management_proxy::config {

  $virtual_ip_for_capapp = hiera('capd-ha-virtual-ipaddress')
  $ida_token_service_url = hiera('ida-token-service-url')
  $nginx_management_proxy_port = hiera('nginx-management-proxy-port', '8543')

  file {'/etc/nginx/':
    ensure => directory,
  }
  ->
  file {'/etc/nginx/nginx.conf':
    ensure => present,
    source => 'puppet:///modules/nginx_management_proxy/nginx.conf',
  }
  ->
  file { '/etc/nginx/conf.d/':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
  }
  ->
  file {'/etc/nginx/conf.d/management-proxy.conf':
    ensure  => present,
    content => template('nginx_management_proxy/management-proxy.conf.erb'),
    require => File['/etc/nginx/conf.d/'],
  }

}
