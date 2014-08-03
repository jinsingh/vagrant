require_relative '../../../../spec_helper.rb'

describe 'defra_fw::management', type: :class do
  it do
    should contain_firewall__('160 accept 80').
    with(
      'port'     => '80',
      'proto'    => 'tcp',
      'action'   => 'accept',
      )
    should contain_firewall__('161 allow SMTP from services 10.179.133.214').
    with(
      'source'   => '10.179.133.214',
      'port'     => '25',
      'proto'    => 'tcp',
      'action'   => 'accept',
      )
    should contain_firewall__('162 allow SMTP from central log server').
    with(
      'source'   => '10.179.134.211',
      'port'     => '25',
      'proto'    => 'tcp',
      'action'   => 'accept',
      )
    should contain_firewall__('163 allow SMTP from web').
    with(
      'source'   => '10.179.135.163',
      'port'     => '25',
      'proto'    => 'tcp',
      'action'   => 'accept',
      )
    should contain_firewall__('215 allow IDA proxy from services 10.179.133.214').
    with(
      'source'   => '10.179.133.214',
      'port'     => '8111',
      'proto'    => 'tcp',
      'action'   => 'accept',
      )
    should contain_firewall__('216 Allow OpenVAS from CAPDevelopment').
    with(
      'source'   => '46.237.130.38',
      'port'     => '9392',
      'proto'    => 'tcp',
      'action'   => 'accept',
    )
    should contain_firewall__('217 allow IDA proxy from web').
    with(
      'source'   => '10.179.135.163',
      'port'     => '8111',
      'proto'    => 'tcp',
      'action'   => 'accept',
      )

  end
end
