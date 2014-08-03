# Class incorporates a number of hardening options.

class hardening {

  include hardening::cron
  include hardening::at
  include hardening::sourcerouting
  include hardening::disable
  include hardening::coredump
  include hardening::userpolicy

}
