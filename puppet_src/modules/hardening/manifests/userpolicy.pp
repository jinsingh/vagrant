# Class sets password policy ie length, compexity and hardens dotfiles

class hardening::userpolicy {

  file {'/etc/login.defs':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('hardening/login.defs.erb'),
  }

  file {'/etc/pam.d/system-auth':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('hardening/system-auth.erb'),
  }

  file {'/var/log/tallylog':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  exec {'harden dot files':
    provider  => shell,
    command   => 'find /home/*/ -maxdepth 1 -name \'.*\' -exec chmod 700 {} \;',
    unless    => 'foo=$(find /home/*/ -maxdepth 1 -name \'.*\' ! -perm 700); if [[ -n $foo ]] ; then exit 1; fi',
  }

}
