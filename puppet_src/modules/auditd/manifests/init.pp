# == Class: auditd
#
# Full description of class audit here.
# Used to control auditd deamon to perform auditing on certain files
# =====================
class auditd {

  include auditd::config, auditd::package, auditd::service

  Class['auditd::package'] -> Class['auditd::config'] ~> Class['auditd::service']
}
