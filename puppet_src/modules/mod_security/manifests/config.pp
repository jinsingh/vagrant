# Class mod_security::config provides configuration
# files for mod_security module for apache

class mod_security::config {

  # actual config files are set of rules from OWASP
  # only one config change is actually required after those
  # are copied in place (lots of files) recursiveley

  file { 'base_rules':
    ensure  => directory, # so make this a directory
    path    => '/etc/httpd/modsecurity.d/base_rules',
    recurse => true, # enable recursive directory management
    purge   => true, # purge all unmanaged junk
    force   => true, # also purge subdirs and links etc.
    owner   => 'root',
    group   => 'root',
    mode    => '0644', # this mode will also apply to files from the source directory
    # puppet will automatically set +x for directories
    source  => '/etc/puppet/modules/mod_security/files/etc/httpd/modsecurity.d/base_rules',
  }

  file { 'optional_rules':
    ensure  => directory, # so make this a directory
    path    => '/etc/httpd/modsecurity.d/optional_rules',
    recurse => true, # enable recursive directory management
    purge   => true, # purge all unmanaged junk
    force   => true, # also purge subdirs and links etc.
    owner   => 'root',
    group   => 'root',
    mode    => '0644', # this mode will also apply to files from the source directory
    # puppet will automatically set +x for directories
    source  => '/etc/puppet/modules/mod_security/files/etc/httpd/modsecurity.d/optional_rules',
  }

  file { 'slr_rules':
    ensure  => directory, # so make this a directory
    path    => '/etc/httpd/modsecurity.d/slr_rules',
    recurse => true, # enable recursive directory management
    purge   => true, # purge all unmanaged junk
    force   => true, # also purge subdirs and links etc.
    owner   => 'root',
    group   => 'root',
    mode    => '0644', # this mode will also apply to files from the source directory
    # puppet will automatically set +x for directories
    source  => '/etc/puppet/modules/mod_security/files/etc/httpd/modsecurity.d/slr_rules',
  }

# this file specifies to use the mod_security and to use files from above directories

  file { '/etc/httpd/conf.d/mod_security.conf':
    source  => '/etc/puppet/modules/mod_security/files/mod_security.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => [ File['base_rules'], File['optional_rules'], File['slr_rules'] ],
    notify  => Service['httpd'],
  }

}
