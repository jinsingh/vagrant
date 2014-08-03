# Class installs capdservices package and requires repository to
# to be set up first

class capdservices::package {

  package { 'capdservices':
    ensure  => hiera('capd-services-version', 'latest'),
    require => Class['repo'],
    notify  => Service['capdservices'],
  }

}
