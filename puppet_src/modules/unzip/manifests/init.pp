# Module ensures unzip is installed

class unzip {

  package{'unzip':
    ensure => hiera('unzip-package-version','installed'),
  }
}
