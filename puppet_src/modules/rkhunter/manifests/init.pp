# class rkhunter makse sure that this rootkit detecton apploication is installed and running daily on every box
# and sends notification in case it finds anthing suspicious

class rkhunter {

include rkhunter::package, rkhunter::config, rkhunter::update # verify once again if this is required here

  Class['rkhunter::package'] -> Class['rkhunter::config']

}
