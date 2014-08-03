require_relative '../../../../spec_helper.rb'

describe 'openssl', :type => :class do
  it do
    should contain_package('openssl').with_ensure('latest')
    should contain_file('/etc/ssl/private').with_ensure('directory')
    should contain_exec('openssl req -new -nodes -x509 -out /etc/ssl/certs/ssl-cert-snakeoil.pem -keyout /etc/ssl/private/ssl-cert-snakeoil.key -days 3650 -subj \'/C=UK/CN=rpa.local\'').
      with_cwd('/var/tmp')
  end
end