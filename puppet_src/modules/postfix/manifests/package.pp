# class makes sure that package postfix is installed

class postfix::package {

  package { 'postfix':
    ensure => hiera('postfix-version', 'installed'),
  }

}
