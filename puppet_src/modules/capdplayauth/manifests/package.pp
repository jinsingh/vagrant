# package control for capdplayauth

class capdplayauth::package{

package { 'capdplayauth' :
    ensure  => hiera('capd-play-auth-version', 'latest'),
    require => Class['repo'],
    notify  => Service['capdplayauth']
  }

}
