# Class defra_fw::post used to decalre rues to be applied at the very end
#
# basically this means to reject anything not matched before
# reason for reject rather than drop is to be found on
# numerous articles on web.
#
class defra_fw::post{

    if $::fqdn =~ /(\.test$)+/ {
      notice('Vagrant server detected! Allowing all to SSH')
      firewall { '998 accept SSH connections on 22 from anywhere':
        port   => '22',
        proto  => 'tcp',
        source => '0.0.0.0/0',
        action => 'accept',
        before => undef,
      }
    }

    firewall { '999 drop all':
        proto   => 'all',
        action  => 'reject',
        before  => undef,
    }

}
