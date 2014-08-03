# Modle to make sure that RackConnect doesn't interfere
# with out own FireWall rules (iptables) and works
# in so-called "merge" mode
#

class rackconnect {

  include rackconnect::config

}
