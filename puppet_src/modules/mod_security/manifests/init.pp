# Class mod_security,
# defines mod_security for apache
# suited only for CentOS boxes

class mod_security {

  include mod_security::config, mod_security::package

  # Order Arrow (->) Causes the resource on the left to be applied before the resource on the right
  # Notification Arrow (~>) Causes the resource on the left to be applied first, and sends a refresh
  # event to the resource on the right if the left resource changes

  Class['mod_security::package'] -> Class['mod_security::config']

}
