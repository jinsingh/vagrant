require_relative '../../../../spec_helper.rb'

describe 'defra_fw::pre', type: :class do
  it do
    should contain_firewall__('000 accept all icmp').
      with(
        'proto'  => 'icmp',
        'action' => 'accept',
    )
    should contain_firewall__('001 accept all to lo interface').
      with(
        'proto'   => 'all',
        'iniface' => 'lo',
        'action'  => 'accept',
    )
    should contain_firewall__('002 accept related established rules').
      with(
        'proto'  => 'all',
        'state'  => '["RELATED", "ESTABLISHED"]',
        'action' => 'accept',
    )
    should contain_firewall__('003 accept SSH connections on 22 from management').
      with(
        'port'   => '22',
        'proto'  => 'tcp',
        'source' => '10.179.134.230',
        'action' => 'accept',
    )
    should contain_firewall__('004 accept SSH connections on 22 from the internal IP of the CI Server').
      with(
        'port'   => '22',
        'proto'  => 'tcp',
        'source' => '192.168.100.8',
        'action' => 'accept',
    )
    should contain_firewall__('005 accept SSH connections on 22 from the external IP of CI Server').
      with(
        'port'   => '22',
        'proto'  => 'tcp',
        'source' => '162.13.22.8',
        'action' => 'accept',
    )
    should contain_firewall__('006 accept OPSVIEW connections on 5666 from monitoring internal').
      with(
        'port'   => '5666',
        'proto'  => 'tcp',
        'source' => '10.179.134.130',
        'action' => 'accept',
    )
    should contain_firewall__('007 accept connections from the Jump server').
      with(
        'port' => '22',
        'proto' => 'tcp',
        'source' => '10.140.0.165',
        'action' => 'accept',
    )
    should contain_firewall__('204 accept OPSVIEW connections on 5667 from monitoring internal').
      with(
        'port' => '5667',
        'proto' => 'tcp',
        'source' => '10.179.134.130',
        'action' => 'accept',
    )

  end
end
