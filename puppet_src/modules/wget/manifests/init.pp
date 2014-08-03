# Class ensures wget is installed

class wget {

  package{'wget':
    ensure => hiera('wget-package-version','installed'),
  }

}
