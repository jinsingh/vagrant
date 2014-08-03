require_relative '../../../../spec_helper.rb'

describe 'nginx_management_proxy::config', :type => :class do
  it do
    should contain_file('/etc/nginx/conf.d/management-proxy.conf').with_content(/8111/).
      with_content(/token-service.staging.ida.digital.cabinet-office.gov.uk/)
  end
end
