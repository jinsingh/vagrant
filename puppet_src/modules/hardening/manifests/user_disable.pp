# Class disables shell access for certain users

class hardening::user_disable($user = undef) {

  exec {"disable ${name} user":
    provider => shell,
    command  => "usermod -s /sbin/nologin ${name}",
    unless   => "cat /etc/passwd | grep ${name} | grep /sbin/nologin",
    onlyif   => "id -u ${name}",
  }
}
