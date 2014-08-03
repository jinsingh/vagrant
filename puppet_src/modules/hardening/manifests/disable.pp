# Definition for disabling shell access for certain users
define hardening::disablesub () {
  exec { "disable ${title} user":
    provider => shell,
    command  => "usermod -s /sbin/nologin ${title}",
    unless   => "cat /etc/passwd | grep ${title} | grep /sbin/nologin",
    onlyif   => "id -u ${title}",
    }
  }

# Class disables shell access for certain users

class hardening::disable {

  $redundant_users = [ 'lp', 'uucp', 'gnats', 'games', 'mail', 'apache', 'daemon' ]

  disablesub {$hardening::disable::redundant_users: }

  }