require_relative '../../../../spec_helper.rb'

describe 'defra_fw::ha', type: :class do
  it do
    should contain_firewall__('230 allow ha-network in on 9003').
      with(
        'source' => '10.1.1.0/24',
        'port'   => '9003',
        'proto'  => 'tcp',
        'action' => 'accept',
    )
    should contain_firewall__('211 allow ha-network in on 8080').
    with(
      'source'   => '10.1.1.0/24',
      'port'     => '8080',
      'proto'    => 'tcp',
      'action'   => 'accept',
      )
    should contain_firewall__('220 allow multicast as required by VRRP').
      with(
        'destination' => '224.0.0.0/8',
        'action'      => 'accept',
    )
    should contain_firewall__('226 allow ha-network in on 9005').
      with(
        'source' => '10.1.1.0/24',
        'port'   => '9005',
        'proto'  => 'tcp',
        'action' => 'accept',
    )
    should contain_firewall__('240 allow ha-network in on 9004').
      with(
        'source' => '10.1.1.0/24',
        'port'   => '9004',
        'proto'  => 'tcp',
        'action' => 'accept',
    )
    should contain_firewall__('241 allow ha-network in on 4686').
      with(
        'source' => '10.1.1.0/24',
        'port'   => '4686',
        'proto'  => 'tcp',
        'action' => 'accept',
    )
  end
end
