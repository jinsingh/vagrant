# Class defines a the libluajit package, adds
# libluajit.conf file to library path and then runs
# ldconfig to update the library path

class libluajit {

  include libluajit::package, libluajit::config, libluajit::ldconfig

  Class['libluajit::package'] -> Class['libluajit::config'] ~> Class['libluajit::ldconfig']

}
