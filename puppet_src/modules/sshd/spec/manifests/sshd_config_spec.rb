require_relative '../../../../spec_helper.rb'

describe 'sshd::config', :type => :class do
  context 'a normal environment' do
    let(:facts) {{ :fqdn => 'foobar.rpa.capaccept' }}
    it do
      should contain_file('/etc/ssh/sshd_config').with_ensure('present').
      with_content(/MaxSessions 30/).with_content(/MaxStartups 30/)
    end
  end

  context 'an environment with apache' do
    let(:facts) {{ :fqdn => 'capmanagement.rpa.capaccept' }}
    it do
      should contain_file('/etc/ssh/sshd_config').with_ensure('present').
      with_content(/MaxSessions 100/).with_content(/MaxStartups 100/)
    end
  end
end

