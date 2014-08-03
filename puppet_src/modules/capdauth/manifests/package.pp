# Class installs capdauth package and requires repository to
# to be set up first

class capdauth::package {
  
  package { 'capdauth' :
    ensure  => hiera('capd-auth-version', 'latest'),
    require => Class['repo'],
    notify  => Service['capdauth'],
  }

}
