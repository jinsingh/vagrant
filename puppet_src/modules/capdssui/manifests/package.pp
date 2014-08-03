# Class ensures httpd package is installed

class capdssui::package {

  package { 'capdssui':
    ensure  => hiera('capd-ssui-version', 'latest'),
    require => Class['repo'],
    notify  => Service['capdssui'],
  }

}
