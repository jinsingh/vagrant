require_relative '../../../../spec_helper.rb'

describe 'opsview_server::config', :type => :class do
  it do
    should contain_package('mysql')
    should contain_package('mysql-server')
    should contain_exec('set-root-mysql-password')
    should contain_exec('create-nagios-database')
    should contain_exec('opsview-db-install')
    should contain_exec('opsview-runtime-install')
    should contain_file('/var/log/opsview/opsviewd.log')
    should contain_exec('opsview-genconfig')
    should contain_file('/etc/httpd/conf.d/')
    should contain_file('/etc/httpd/conf/httpd.conf')
    should contain_file('/etc/rsyslog.d/33-httpd.conf')
    should contain_file('/etc/httpd/conf.d/opsview.conf')
    should contain_exec('add-apache-user-to-nagios')
  end
end
