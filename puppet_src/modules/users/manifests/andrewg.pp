# Adding user for Andrew Gorton
class users::andrewg {

  users::account {'andrewg':
    fullname => 'Andrew Gorton',
    email    => 'A.Gorton@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDOH3Jq+F/eAFMxQg0j30r3ZQqa6JBqE/tQHrTTE1AXRsFEo/iuJA1eNEnQW3R+RKAAfZVekSMWAkptV1NfkTD9as3hkW+McCcVBWgS4/H2r7ZlOJa9BK/gv1ROgz9p6wI0hZTyQxlRtTIe6Vnw/uZoddFuqYgRdChmn4bAcJMx81wmvWxBg6ggnvjZldyc1YoONpSY3F6w/GRu9ZVipp0ov00AqZoGaCVvbS43ws3XuK66MediR5U0CCy38HIS7X/REWeF1QAgAicKyJ7qXuKZ4eNydROOdOCWaDlQ0sw+9Nd347Jmt87s53tn/RqOC2Dt1e1J1eF3F2CTIE4pPEUP',
  }
}