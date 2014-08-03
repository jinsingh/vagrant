# Class ensures nc (netcat) is installed

class nc {

  package{'nmap-ncat':
    ensure  => hiera('nmap-ncat-version', 'installed'),
    require => Class['repo'],
  }

}
