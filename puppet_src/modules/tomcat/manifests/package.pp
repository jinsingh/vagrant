# Install Tomcat from yumrepo
class tomcat::package {

  package { 'tomcat6':
    ensure => hiera('tomcat-6-package-version','installed'),
    notify => Service['tomcat6']
  }

  package { 'tomcat6-webapps':
    ensure => hiera('tomcat-6-webapps-package-version','installed'),
  }
  package { 'tomcat6-admin-webapps':
    ensure => hiera('tomcat-6-admin-webapps-package-version','installed'),
  }

}
