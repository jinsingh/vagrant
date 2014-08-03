# Class ensures nginx service is running and enabled on boot

class nginx_management_proxy::service{

  service {'nginx':
    ensure  => running,
    enable  => true,
  }
}
