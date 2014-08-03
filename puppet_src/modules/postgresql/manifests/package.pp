# Class ensures postgresql92 is installed

class postgresql::package {

  package { 'postgresql92-server' :
    ensure => present,
  }

}
