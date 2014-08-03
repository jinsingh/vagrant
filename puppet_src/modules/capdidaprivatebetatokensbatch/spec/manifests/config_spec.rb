require_relative '../../../../spec_helper.rb'

describe 'capdidaprivatebetatokensbatch::config', type: :class do
  it do
    should contain_file('/opt/capdidaprivatebetatokensbatch/config.yml').
	    with_ensure('present').
        with_content(/idaTokenServiceBaseUrl: https:\/\/token-service.staging.ida.digital.cabinet-office.gov.uk/).
        with_content(/capServicesBaseUrl: 192.168.99.111:4685/).
        with_content(/tokenServiceSystemCallerId: -2/).
        with_content(/idaTokenServiceUserName: hi/).
        with_content(/idaTokenServicePassword: secret/)
  end
end
