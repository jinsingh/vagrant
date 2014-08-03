# Class postfix - for setting up local SMTP relay on management boxes

class postfix {

  include postfix::package, postfix::config, postfix::service

  Class['postfix::package'] -> Class['postfix::config'] ~> Class['postfix::service']

}
