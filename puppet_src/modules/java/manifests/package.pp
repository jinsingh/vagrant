# this ensures that Java package of specified version is installed

class java::package {

  package { 'java-1.7.0-openjdk':
    ensure => hiera('java-package-version','installed'),
  }

}
