require_relative '../../../../spec_helper.rb'

describe 'opsview_agent', :type => :class do
  it do
    should contain_class('opsview_agent::config')
    should contain_class('opsview_agent::package')
    should contain_class('opsview_agent::service')
  end
end