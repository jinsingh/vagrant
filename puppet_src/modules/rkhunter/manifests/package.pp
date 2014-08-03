# makse sure rkhunter package is installed
# this goes from epel repo

class rkhunter::package {

  package { 'rkhunter':
    ensure  => hiera('rkhunter-version', 'latest'),
    require => Class ['epel'],
  }

}
