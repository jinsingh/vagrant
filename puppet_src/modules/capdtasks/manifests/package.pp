# Class installs python-requests and capdtasks

class capdtasks::package {

  package { 'capdtasks':
    ensure  => hiera('capd-tasks-version', 'latest'),
    require => Class ['repo'],
  }

}
