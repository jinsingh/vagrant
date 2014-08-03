require_relative '../../../../spec_helper.rb'

describe 'defra_fw::post', type: :class do
  context 'vagrant environment' do
    let(:facts) {{ :fqdn => 'capweb.test' }}
    it do
      should contain_firewall__('998 accept SSH connections on 22 from anywhere').
      with(
        'port'   => '22',
        'proto'  => 'tcp',
        'source' => '0.0.0.0/0',
        'action' => 'accept',
        'before'  => nil,
      )
      should contain_firewall__('999 drop all').
      with(
        'proto'  => 'all',
        'action' => 'reject',
        'before' => nil,
      )
    end
  end

  context 'non vagrant environment' do
    let(:facts) {{ :fqdn => 'capweb.rpa.capaccept' }}
    it do
      should_not contain_firewall__('998 accept SSH connections on 22 from anywhere').
      with(
        'port'   => '22',
        'proto'  => 'tcp',
        'source' => '0.0.0.0/0',
        'action' => 'accept',
        'before'  => nil,
        )
      should contain_firewall__('999 drop all').
      with(
        'proto'  => 'all',
        'action' => 'reject',
        'before' => nil,
      )
    end
  end
end