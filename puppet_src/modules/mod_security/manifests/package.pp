# class makes sure that package is installed

class mod_security::package {
  
  package { 'mod_security':
    ensure  => hiera('mod-security-version','latest'),
    alias   => 'mod_security',
    require => Package['httpd'],
    notify  => Service['httpd']
  }
}
