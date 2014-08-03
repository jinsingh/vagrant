# Ensure the service is working for auditd
class auditd::service {

  service { 'auditd':
    ensure  => running,
    enable  => true,
  }

}
