require_relative '../../../../spec_helper.rb'

describe 'defra_fw::services', type: :class do
  it do


    should contain_firewall__('230 allow ha-master in on 9003').
      with(
        'source' => '10.179.134.200',
        'port'   => '9003',
        'proto'  => 'tcp',
        'action' => 'accept',
    )
    should contain_firewall__('231 allow ha-slave in on 9003').
      with(
        'source' => '10.179.134.200',
        'port'   => '9003',
        'proto'  => 'tcp',
        'action' => 'accept',
    )
    should contain_firewall__('150 allow WEB in on 4685').
        with(
            'source' => '10.179.135.163',
            'port'   => '4685',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('151 allow WEB in on 5000').
        with(
            'source' => '10.179.135.163',
            'port'   => '5000',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('209 allow WEB in on 8700').
        with(
            'source' => '10.179.135.163',
            'port'   => '8700',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('212 allow ha-master in on 8080').
        with(
            'source' => '10.179.134.200',
            'port'   => '8080',
            'proto'  => 'tcp',
            'action' => 'accept',
        )
  
    should contain_firewall__('213 allow ha-master in on 4685').
        with(
            'source' => '10.179.134.200',
            'port'   => '4685',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('214 allow ha-master in on 5000').
        with(
            'source' => '10.179.134.200',
            'port'   => '5000',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('215 allow ha-master in on 8700').
        with(
            'source' => '10.179.134.200',
            'port'   => '8700',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('220 allow ha-master in on 8750').
        with(        
            'source' => '10.179.134.200',
            'port'   => '8750',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('212 allow ha-slave in on 8080').
        with(
            'source' => '10.179.134.201',
            'port'   => '8080',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('216 allow ha-slave in on 4685').
        with(
            'source' => '10.179.134.201',
            'port'   => '4685',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('217 allow ha-slave in on 5000').
        with(
            'source' => '10.179.134.201',
            'port'   => '5000',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('218 allow ha-slave in on 8700').
        with(
            'source' => '10.179.134.201',
            'port'   => '8700',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('221 allow ha-slave in on 8750').
        with(
            'source' => '10.179.134.201',
            'port'   => '8750',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('210 allow memcached in on 11211').
        with(
            'source' => '192.168.100.8',
            'port'   => '11211',
            'proto'  => 'tcp',
            'action' => 'accept',
        )
  
    should contain_firewall__('222 allow monitoring in on 5001').
        with(
            'source' => '10.179.134.130',
            'port'   => '5001',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('223 allow monitoring in on 8701').
        with(
            'source' => '10.179.134.130',
            'port'   => '8701',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('224 allow monitoring in on 9004').
        with(
            'source' => '10.179.134.130',
            'port'   => '9004',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('225 allow monitoring in on 4686').
        with(
            'source' => '10.179.134.130',
            'port'   => '4686',
            'proto'  => 'tcp',
            'action' => 'accept',
        )

    should contain_firewall__('226 allow monitoring in on 8751').
        with(
            'source' => '10.179.134.130',
            'port'   => '8751',
            'proto'  => 'tcp',
            'action' => 'accept',
        )
    should contain_firewall__('221 allow ha-master in on 9005').
      with(
        'source' => '10.179.134.200',
        'port'   => '9005',
        'proto'  => 'tcp',
        'action' => 'accept',
    )
    should contain_firewall__('221 allow ha-slave in on 9005').
      with(
        'source' => '10.179.134.201',
        'port'   => '9005',
        'proto'  => 'tcp',
        'action' => 'accept',
    )
    end
end
