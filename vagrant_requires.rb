class String
  def red
    "\033[31m#{self}\033[0m"
  end
  def green
    "\033[32m#{self}\033[0m"
  end
end

MIN_REQUIRED_VAGRANT_VERSION = '1.6.0'
REQUIRED_PLUGINS = [ 'vagrant-cachier', 'vagrant-vbguest', 'vagrant-vbox-snapshot', 'vagrant-puppet-install' ]

if Vagrant::VERSION < MIN_REQUIRED_VAGRANT_VERSION
  puts "ERROR: We require Vagrant version >=#{MIN_REQUIRED_VAGRANT_VERSION}. Please upgrade.\n".red
  puts "Downloads avaliable here: http://www.vagrantup.com/downloads.html".green
  exit 1
end

REQUIRED_PLUGINS.map do |plugin|
  unless Vagrant.has_plugin?(plugin)
    puts "#{plugin} missing! Please install missing Vagrant plugin by running:\n".red
    abort "vagrant plugin install #{plugin}".green
  end
end
