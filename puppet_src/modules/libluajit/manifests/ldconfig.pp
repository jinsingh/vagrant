# Class runs ldconfig to update the library path

class libluajit::ldconfig {

  case $::osfamily {
    'RedHat': {
      exec {'ldconfig':
        command => 'ldconfig',
      }
    }
    default: {}
  }

}
