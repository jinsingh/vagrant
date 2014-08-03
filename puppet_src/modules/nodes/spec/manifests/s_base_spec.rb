require_relative '../../../../spec_helper.rb'

describe 'nodes::s_base', :type => :class do
  let(:facts) {{ :kernel => 'Linux' }}
  it do
    should contain_class('unzip')
    should contain_class('wget')
    should contain_class('sshd')
    should contain_class('users')
    should contain_class('hosts')
    should contain_class('deploy')
    should contain_class('auditd')
    should contain_class('rackconnect')
    should contain_class('hardening')
    should contain_class('openssl')
    should contain_class('repo')
    should contain_class('defra_fw')
    should contain_class('software_updates')
    should contain_class('ntp').with(
      'servers' => ['ntp-rules.org', '1.uk.pool.ntp.org',]
    )
  end
end
