# Class installs capdsitiserviceintegration package and requires repository to
# to be set up first

class capdsitiserviceintegration::package {

  package { 'capdsitiserviceintegration':
    ensure  => hiera('capd-siti-service-integration-version', 'latest'),
    require => Class['repo'],
    notify  => Service['capdsitiserviceintegration'],
  }

}
