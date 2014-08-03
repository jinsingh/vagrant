# Ensure the auditd package is installed
class auditd::package {

  package { 'audit':
    ensure => present,
  }

}
