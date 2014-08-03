# Class pip
class pip {

  package { 'python-pip':
    ensure => hiera('python-pip-version', 'latest'),
  }

}
