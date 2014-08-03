require_relative '../../../../spec_helper.rb'

describe 'opsview_server', :type => :class do
  it do
    should contain_class('opsview_server::config')
    should contain_class('opsview_server::package')
    should contain_class('opsview_server::service')
  end
end