require_relative '../../../../spec_helper.rb'

describe 'capdsitiserviceintegration::config', type: :class do
  it do
    should contain_file('/opt/capdsitiserviceintegration/mocksConfig.yml').
      with_ensure('present').
      with_content(/baseUrl: http:\/\/10.1.1.1:8080/)
    should contain_file('/etc/rsyslog.d/11-capmocks.conf').
      with_ensure('present').
      with_source('puppet:///modules/capdsitiserviceintegration/11-capmocks.conf')
  end
end
