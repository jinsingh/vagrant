# service sshd - enabled and running

class sshd::service {

  service { 'sshd' :
    ensure     => running,
    enable     => true,
    name       => 'sshd',
    hasstatus  => true,
    hasrestart => true,
  }

}
