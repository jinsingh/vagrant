require_relative '../../../../spec_helper.rb'

describe 'opsview_server::service', :type => :class do
  it do
    should contain_service('opsview-web')
    should contain_service('httpd')
  end
end