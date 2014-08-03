# Class ensures nginx service is running and enabled on boot

class nginx::service{

  case $::osfamily {
    'RedHat': {
      service {'nginx':
        ensure  => running,
        enable  => true,
      }
    }
    'Darwin': {
      service { 'dev.nginx':
        ensure  => running,
      }
    }
    default: {}
  }
}
