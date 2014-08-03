# This class is to get the data files
# provided by Aabco to wms server for load

class siti_data{

package { 'capd-siti-data':
  ensure  => hiera('siti-data-version', 'latest'),
  require => Class['repo'],
}

}