require_relative '../../../../spec_helper.rb'

describe 'postfix::config', :type => :class do
 let(:facts) { {:fqdn => 'test.server', :ipaddress_eth0 => '10.0.0.199'} }

  it do
    should contain_file('/etc/postfix/')
    should contain_file('/etc/postfix/main.cf').
          with_content(/mynetworks = 10.0.0.199 127.0.0.1/).
          with_content(/relayhost = 10.179.134.230/)
    should contain_file('/etc/postfix/master.cf')
    should contain_file('/etc/ssl/certs/ssl-cert-snakeoil.pem')
    should contain_file('/etc/ssl/private/ssl-cert-snakeoil.key')
    should contain_file('create etc dir for postfix')
    should contain_exec('copy services to postfix')
  end
end