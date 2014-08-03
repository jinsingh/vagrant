# Ensures that createrepo and httpd packages are insstalled

class yumrepo::package {

    package { 'createrepo':
      ensure => hiera('createrepo-package-version','installed')
    }
    package { 'httpd':
      ensure => hiera('httpd-package-version','installed')
    }
    package { 'yum-utils':
      ensure => 'installed',
    }
}
