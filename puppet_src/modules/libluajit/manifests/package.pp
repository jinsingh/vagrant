# Class installs libluajit

class libluajit::package {

  case $::osfamily {
    'RedHat': {

      package { 'libluajit':
        ensure  => hiera('libluajit-version', 'latest'),
        require => Class ['repo'],
      }
      
    }
    default: {}
  }

}
