# Class installs capdb_db

class capddata::package {

  package { 'capddata':
    ensure  => hiera('capd-data-version', 'latest'),
    require => Class ['repo'],
    notify  => [ Exec['capd_db_update'], Exec['capd_auth_db_update'], ],
  }

}
