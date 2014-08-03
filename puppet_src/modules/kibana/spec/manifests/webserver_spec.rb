require_relative '../../../../spec_helper.rb'

describe 'kibana::webserver', :type => :class do
  it do
    should contain_file('/var/www/users')
    should contain_file('/etc/httpd/conf/httpd.conf')
    should contain_file('/etc/rsyslog.d/33-httpd.conf')
    should contain_exec('Sign certificate')
    should contain_exec('Generate CSR')
    should contain_exec('Generate httpd key')
    should contain_package('mod_ssl')
    should contain_package('httpd')
  end
end

